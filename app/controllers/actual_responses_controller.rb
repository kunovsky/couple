class ActualResponsesController < ApplicationController
  include ActualResponsesHelper
  def create
    render json: Saver.new(params).process_actual_response, status: 200
  end
end