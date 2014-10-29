class SessionsController < ApplicationController
  
  def create
    session[:auth_token] = handle_user_creation
    render json: {path: return_path}, status: 200
  end

  def destroy
    session.delete(:auth_token)
    redirect_to '/'
  end

  def invite
    return redirect_to '/' if !Invite.exists?(invite_token: params[:invite_token])
    invite = Invite.find_by(invite_token: params[:invite_token])
    session[:auth_token] = invite.user.auth_token
    invite.update_attribute(:invite_token, nil)
    redirect_to return_path
  end

  def results
    return redirect_to '/' if !Invite.exists?(invite_token: params[:invite_token])
    invite = Invite.find_by(invite_token: params[:invite_token])
    session[:auth_token] = invite.user.auth_token
    invite.update_attribute(:invite_token, nil)
    redirect_to '/user/results'
  end

  private

  def handle_user_creation
    user = User.create!
    user.auth_token
  end

  def return_path
    ['/user','grouping', '1'].join('/')
  end
end