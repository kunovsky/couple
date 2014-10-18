class ActualResponsesController < ApplicationController
  include ActualResponseHelpers

  def index
    #move the actual response data out of the grouping helpers concern and into here
  end

  def create
    if !user_same
      render json: {path: '/logout'}, status: 403
    else
      render json: {completed: Saver.new(params).process_actual_response}, status: 200
    end
  end
  
end