class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(session[:auth_token]) if session[:auth_token]
  end

  def user_same
    redirect_to logout_path if (User.find(params[:user_id]) != current_user)
  end

  helper_method :current_user, :user_same
end