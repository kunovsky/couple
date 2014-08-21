class CompletedQuestionnairesController < ApplicationController
  include CompletedQuestionnaireHelpers
  def create
    #take this out !!
    params[:user_id] = current_user.id
    #take this out !!
    render json: Handler.new(params).handle_questionnaire, status: 200
  end
end