class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: %i[create]

  def create
    @user = User.find_by(username: session_params[:username], email: session_params[:email], active: true)
    if @user.present?
      if @user.authenticate(session_params[:password])
        login!
        render json: @user.as_json
      else
        render json: { errors: ['Contraseña Incorrecta'] }, status: :unauthorized
      end
    else
      render json: { errors: ['Usuario no encontrado'] }, status: :unprocessable_entity
    end
  end

  def is_logged
    if logged_in? && current_user
      render json: { logged_in: true, user: current_user.as_json }
    else
      render json: { logged_in: false, message: 'no such user' }
    end
  end

  def destroy
    logout!
    render json: { logged_out: true }, status: :ok
  end
  private

  def session_params
    params.require(:user).permit(:username, :email, :password)
  end
end
