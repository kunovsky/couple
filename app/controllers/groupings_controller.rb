class GroupingsController < ApplicationController
  include GroupingHelpers
  def show
    render json: select_and_format_all_questionnaires(params[:id])
  end
end