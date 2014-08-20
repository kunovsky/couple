class SessionsController < ApplicationController
  def create
    session[:user_id] = handle_user_creation
    render json: user, status: 200
  end

  private
  def handle_user_creation
    user = User.create!
    ActualResponse.create! user_id: user_id
    user.id
  end
end