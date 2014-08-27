class RelationshipsController < ApplicationController

  def score
    if current_user.relationship
      #start here
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
    ### TAKE OUT ###
    params[:relationship_id] = current_user.relationship.id
    ### TAKE OUT ###
    RelationshipResults::Stat.new(params).handle_results_request
  end
end

