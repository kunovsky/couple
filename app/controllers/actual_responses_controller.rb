class ActualResponsesController < ApplicationController
  include ActualResponseHelpers
  def create
    #take this out !!
    params[:user_id] = current_user.id
    #take this out !!
    render json: Saver.new(params).process_actual_response, status: 200
  end
end