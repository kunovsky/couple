class ActualResponsesController < ApplicationController
  include ActualResponseHelpers

  def index
    #TODO: move the actual response data out of the grouping helpers concern and into here
  end

  def create
    if !user_same
      render json: {path: '/logout'}, status: 403
    else
      #TODO: Use local storage to save all the responses for each section and then when a section is complete save all the answers
      #TODO: Do the same thing for get_actual_response_count
      render json: {completed: Saver.new(params).process_actual_response, total_answered: get_actual_response_count}, status: 200
    end
  end
  
end

