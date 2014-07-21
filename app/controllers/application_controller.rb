class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include QuestionnaireHelper
  def index
  end
end