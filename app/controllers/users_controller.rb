class UsersController < ApplicationController
  include ValidationHelpers

  def index
    redirect_to '/' unless current_user
  end

  def create
    user = User.create!(relationship_id: current_user.relationship_id)
    session[:auth_token] = user.auth_token
    render json: {path: 'grouping/1'}, status: 200
  end

  def invite
    user = User.create!(relationship_id: current_user.relationship_id)
    invite = Invite.create(user_id: user.id)
    if valid_number?(params[:text]) #TODO: move these to the validations helpers module
      render json: user.invite_via_text({number: params[:text], invite_token: invite.invite_token}), status: 200
    elsif valid_email?(params[:email])
        # render json: user.invite_via_email({email: params[:email], invite_token: invite.invite_token}), status: 200
      render json: {}, status: 200
    else
      render json: {errors: "Not valid"}, status: 422
    end
  end

  def score
    if current_user.already_taken
      render json: true, layout: nil, status: 200
    elsif current_user.relationship
      partner_notification if current_user.partner_contact_info
      render json: Scoring::Couple.new(current_user).handle_relationship_scoring, status: 200
    else
      render json: Scoring::Individual.new(current_user).handle_relationship_scoring, status: 200
    end
  end

  def results
    redirect_to '/' unless current_user
    render json: result, status: 200
  end

  def notification
    if params[:email] #TODO: Look into sanatizing these inputs if that is necessary
      render json: current_user.update_attribute(:email, params[:email]), status: 200
    elsif params[:text]
      render json: current_user.update_attribute(:phone, params[:text]), status: 200
    else
      render json: {errors: "Not valid"}, status: 422
    end
  end
 

  private

  #TODO: Move this
  def partner_notification
    invite = Invite.create(user_id: current_user.partner.id)
    if current_user.partner_phone
      current_user.handle_partner_notification({number: current_user.partner_phone, invite_token: invite.invite_token}) 
    elsif current_user.partner_email
      current_user.handle_partner_notification({email: current_user.partner_phone, invite_token: invite.invite_token})
    end
  end

  def user_params
    params.permit(:email, :text)
  end

  def result
    RelationshipResults::Stat.new(params[:id], current_user.id).handle_results_request
  end
end