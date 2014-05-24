class QuestionsController < ApplicationController
  respond_to :json

  def index
    @questions = Question.all
    render json: @questions
  end

end