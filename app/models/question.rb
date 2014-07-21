class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :questions_responses
  has_many :possible_responses, through: :questions_responses
end
