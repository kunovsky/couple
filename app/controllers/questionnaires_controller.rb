class QuestionnairesController < ApplicationController
  include QuestionnairesHelper
  def show
    render json: format_questionnaire(params[:id])
  end
end