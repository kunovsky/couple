class ActualResponsesController < ApplicationController
  respond_to :json

  def create
    #start here
    actual_responses = update_actual_responses(params)
    # @actual_resp = user.actual_responses.find_or_create_by(id: params[:id]) {|a| a.possible_response_id = params[:prid]}
    render json: true
  end

  def update
    user = User.find(params[:user_id])
    @actual_resp = user.actual_responses.find(params[:id])
    @actual_resp.update_attribute(:possible_response_id, params[:prid])
    render json: @actual_resp
  end
end