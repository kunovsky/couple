class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  private

  def current_user
    return nil unless session[:auth_token].present?

    @current_user ||= -> {
      user = User.find_by_auth_token!(session[:auth_token])
      return nil unless user.present?
      user
    }.call

    return @current_user if @current_user.present?

    reset_session
    return nil
  end

  def user_same
    return if !User.exists?(id: params[:user_id])
    return if User.find(params[:user_id]) != current_user
    true
  end

  helper_method :current_user, :user_same
end