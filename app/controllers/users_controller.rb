class UsersController < ApplicationController

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
    if user.valid_number?(params[:text]) #TODO: move these to the validations helpers module
      render json: user.invite_via_text({number: params[:text], invite_token: invite.invite_token}), status: 200
    elsif user.valid_email?(params[:email])
        render json: user.invite_via_email({email: params[:email], invite_token: invite.invite_token}), status: 200
    else
      render json: {errors: "Not valid"}, status: 422
    end
  end

  def score
    if current_user.already_taken
      render json: true, layout: nil, status: 200
    elsif current_user.relationship 
      render json: Scoring::Couple.new(current_user).handle_relationship_scoring, status: 200
    else
      render json: Scoring::Individual.new(current_user).handle_relationship_scoring, status: 200
    end
  end

  def results
    redirect_to '/' unless current_user
    render json: result, status: 200
  end

  private

  def result
    RelationshipResults::Stat.new(params[:id], current_user.id).handle_results_request
  end
end