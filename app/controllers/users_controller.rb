class UsersController < ApplicationController
  skip_before_action :user_same, only: [:index]

  def index
  end

  def create
    #TODO: refactor to have actual responses created by default when a user is created
    user = User.create!(relationship_id: current_user.relationship_id)
    ActualResponse.create!(user_id: user.id)
    session[:auth_token] = user.auth_token
    render json: {path: 'questionnaire/1'}, status: 200
  end

  def score
    if already_taken
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

  def already_taken
    current_user.taken
  end
end