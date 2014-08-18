class CompletedQuestionnairesController < ApplicationController
  include CompletedQuestionnairesHelper
  def create
    render json: completed_questionnaire_handler, status: 200
  end

  private
  def completed_questionnaire_handler
    CompletedQuestionnairesHelper::Handler.new(params).handle_questionnaire
  end
end