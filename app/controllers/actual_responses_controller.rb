class ActualResponsesController < ApplicationController
  include ActualResponseHelpers

  def create
    if !user_same
      render json: {path: '/logout'}, status: 403
    else
      render json: {completed: Saver.new(params).process_actual_response}, status: 200
    end
  end
  
end