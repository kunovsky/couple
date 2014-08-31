class ActualResponsesController < ApplicationController
  include ActualResponseHelpers
  before_action :user_same

  def create
    render json: {completed: Saver.new(params).process_actual_response}, status: 200
  end
end