class ActualResponsesController < ApplicationController
  respond_to :json

  def create
    user = User.find(params[:user_id])
    @actual_resp = user.actual_responses.find_or_create_by(id: params[:id]) {|a| a.possible_response_id = params[:prid]}
    render json: @actual_resp
  end

  def update
    user = User.find(params[:user_id])
    @actual_resp = user.actual_responses.find(params[:id])
    @actual_resp.update_attribute(:possible_response_id, params[:prid])
    render json: @actual_resp
  end
end