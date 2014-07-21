class PossibleResponse < ActiveRecord::Base
  has_many :questions_responses
  has_many :questions, through: :questions_responses
end
