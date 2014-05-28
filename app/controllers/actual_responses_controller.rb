class ActualResponsesController < ApplicationController
  respond_to :json

  def create
    user = User.first
    @actual_response = user.actual_responses.find_or_create_by(possible_response_id: params[:qid] )
    @actual_response.possible_response_id = params[:qid]
    @actual_response.save
    render json: @actual_response
  end

  def update
  end

end