class ApplicationController < ActionController::API
  before_action :authenticate!

  def authenticate!
    return if logged_in? && current_user

    render json: { message: "No ha iniciado sesión" }, status: :unauthorized
  end

  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  rescue_from RailsParam::InvalidParameterError do |exception|
    render json: { message: exception.message }, status: :unprocessable_entity
  end
end
