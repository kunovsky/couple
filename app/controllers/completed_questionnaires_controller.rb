class CompletedQuestionnairesController < ApplicationController
  include CompletedQuestionnairesHelper
  def create
    render json: Handler.new(params).handle_questionnaire, status: 200
  end
end