class QuestionnairesController < ApplicationController
  include QuestionnaireHelpers
  def show
    render json: format_questionnaire(params[:id])
  end
end