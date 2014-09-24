class InvitesController < ApplicationController
  include ValidationHelpers
  def create
    if valid_number?(params[:text]) #TODO: move these to the validations helpers module
      user = User.create!(relationship_id: current_user.relationship_id)
      invite = Invite.create(user_id: user.id)
      render json: user.invite_via_text({number: params[:text], invite_token: invite.invite_token}), status: 200
    elsif valid_email?(params[:email])
      user = User.create!(relationship_id: current_user.relationship_id)
      invite = Invite.create(user_id: user.id)
      user.invite_via_email({email: params[:email], invite_token: invite.invite_token})
      render json: true , status: 200
    else
      render nothing: true, status: 422
    end
  end
end