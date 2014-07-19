class Questionnaire < ActiveRecord::Base
  has_many :completed_questionnaires
  has_many :users, through: :completed_questionnaires
  has_many :questions
  has_many :quadrants
end
