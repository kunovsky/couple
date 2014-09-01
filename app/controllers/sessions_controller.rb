class SessionsController < ApplicationController
  
  def create
    session[:auth_token] = handle_user_creation
    render json: {path: return_path}, status: 200
  end

  def destroy
    session.delete(:auth_token)
    redirect_to '/'
  end

  private

  def handle_user_creation
    user = User.create!
    user.auth_token
  end

  def return_path
    'questionnaire/1'
  end
end