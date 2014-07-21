class QuestionnairesController < ApplicationController
  def show
    render json: format_questionnaire(params[:id])
  end
end

