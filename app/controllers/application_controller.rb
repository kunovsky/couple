class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(session[:auth_token]) if session[:auth_token]
  end 
end