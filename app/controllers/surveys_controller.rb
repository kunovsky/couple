class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id]).questions
    render json: @survey
  end
end
