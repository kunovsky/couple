class UsersController < ApplicationController
  def index
  end

  def score
    if User.find(params[:user_id]) != current_user 
      render json: {path: 'logout'}, status: 403
    elsif already_taken
      render json: {path: 'results'}, status: 403
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