class PossibleResponsesController < ApplicationController

  def index
    @possible_responses = Question.find(params[:question_id]).possible_responses
    render json: @possible_responses
  end

end