class UsersController < ApplicationController
  skip_before_action :authenticate!, only: %i[create]
  before_action :validate_sign_up_params, only: :create
  before_action :validate_search_params, only: :search

  def show
   user = current_user
    if user
      render json: { user: user.as_json }
    else
      render json: { errors: ['user not found'] }
    end
  end

  def create
    @user = User.new(user_params)
    @user.build_social_network
    @user.build_user_configuration
    if @user.save
      login!
      render json: { user: @user }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = Users::Updater.call(current_user, params)
    if user.errors.blank?
      render json: { user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    if user.update(active: false)
      logout!
      render json: { message: 'Desactivated account' }, status: :ok
    else
      render json: { message: 'No se pudo desactivar la cuenta' }, status: :unprocessable_entity
    end
  end

  def search
    role = params[:role]
    keyword = params[:keyword]
    users = Users::Searcher.call(role, keyword)
    result = UsersFacade.new(users)
    render json: result.formatter.to_json, status: :ok
  end

  private

  def validate_sign_up_params
    param! :user, Hash do |b|
      b.param! :dni, Integer, required: false
      b.param! :role, Integer, required: true, max: 2, min: 0
    end
  end

  def validate_search_params
    param! :role, Integer, required: true, max: 2, min: 0
  end

  def user_params
    params.require(:user).permit(:username,
                                 :first_name,
                                 :last_name,
                                 :dni,
                                 :email,
                                 :role,
                                 :password,
                                 :password_confirmation)
  end
end
