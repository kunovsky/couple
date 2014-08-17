class ActualResponsesController < ApplicationController
  respond_to :json

  def create
    render json: actual_response_handler(:process_actual_response), status: 200
  end

  def update
    user = User.find(params[:user_id])
    @actual_resp = user.actual_responses.find(params[:id])
    @actual_resp.update_attribute(:possible_response_id, params[:prid])
    render json: @actual_resp
  end
  
  private

  def actual_response_handler(method)
    Saving::ActualResponseSaving.new(params).public_send(method)
  end
end