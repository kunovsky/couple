class UsersController < ApplicationController

  def index
  end

  def create
    user = User.create!(relationship_id: current_user.relationship_id)
    session[:auth_token] = user.auth_token
    render json: {path: 'questionnaire/1'}, status: 200
  end

  def invite
    if valid_params?(params)
      user = User.create!(relationship_id: current_user.relationship_id)
      invite = Invite.create(user_id: user.id)
      if params[:text]
        render json: user.invite_via_text({number: params[:text], invite_token: invite.invite_token}), status: 200
      else 
        render json: user.invite_via_email(params[:email], invite.invite_token), status: 200
      end
    else
      render json: {errors: "Not a valid number or email"}, status: 422
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
    render json: result, status: 200
  end

  private

  def result
    relationship = current_user.relationship
    RelationshipResults::Stat.new(params, relationship).handle_results_request
  end

  def valid_params?(params)
    #TODO: make this method actually do something
    params[:email].present? || params[:text].present?
  end
end