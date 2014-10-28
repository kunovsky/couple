class UsersController < ApplicationController

  def index
    #TODO: add can can can and get rid of all the unless current_user the below code
    redirect_to '/' unless current_user
    @products = Product.all.select {|p|p.data['showcase']}
    @app = Product.find(1)
  end

  def create
    session[:current_user_auth_token] = current_user.auth_token
    user = User.create!(relationship_id: current_user.relationship_id)
    session[:auth_token] = user.auth_token
    render json: {path: '/user/grouping/1'}, status: 200
  end

  def score
    if current_user.already_taken
      render json: true, layout: nil, status: 200
    elsif current_user.relationship
      partner_notification if current_user.partner_contact_info
      Scoring::Couple.new(current_user).handle_relationship_scoring
      taking_for_partner
      render nothing: true , status: 200
    else
      render json: Scoring::Individual.new(current_user).handle_relationship_scoring, status: 200
    end
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

  def scores
    redirect_to '/' unless current_user
    render json: Results::Scores.new(params[:id], current_user.id).format_result, status: 200
  end

  def content
    redirect_to '/' unless current_user
    render json: Results::Content.new(params[:id], current_user.id).format_result, status: 200
  end

  def invite_status
    redirect_to '/' unless current_user
    render json: Results::InviteStatus.new(current_user.id).invite_status, status: 200
  end
 
  private

  def taking_for_partner
     return unless session[:current_user_auth_token]
     return unless token = User.find_by(auth_token: session[:current_user_auth_token]).auth_token
     session.delete(:current_user_auth_token)
     session[:auth_token] = token
  end

  #TODO: Move this to an appropriate place
  def partner_notification
    invite = Invite.create(user_id: current_user.partner.id)
    if current_user.partner_phone
      current_user.notify_via_text({number: current_user.partner_phone, invite_token: invite.invite_token})
    elsif current_user.partner_email
      current_user.notify_via_email({email: current_user.partner_email, invite_token: invite.invite_token})
    end
  end

  def user_params
    params.permit(:email, :text)
  end
end