class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include QuestionnaireHelper
  include ActualResponseHelper
  def index
  end
end