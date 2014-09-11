class CompletedQuestionnairesController < ApplicationController
  include CompletedQuestionnaireHelpers

  def create
    if !user_same
      render json: {path: '/logout'}, status: 403
    else
      render json: Handler.new(params).handle_questionnaires, status: 200
    end
  end
end