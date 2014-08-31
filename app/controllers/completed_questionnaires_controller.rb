class CompletedQuestionnairesController < ApplicationController
  include CompletedQuestionnaireHelpers
  before_action :user_same
  def create
    render json: Handler.new(params).handle_questionnaire, status: 200
  end
end