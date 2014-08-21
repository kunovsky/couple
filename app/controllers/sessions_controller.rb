class SessionsController < ApplicationController
  def create
    session[:auth_token] = handle_user_creation
    render json: true, status: 200
  end

  def destroy
    session.delete(:auth_token)
  end

  private
  def handle_user_creation
    user = User.create!
    ActualResponse.create! user_id: user.id
    user.auth_token
  end
end