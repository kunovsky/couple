class PossibleResponse < ActiveRecord::Base
  belongs_to :question
  has_many :actual_responses
end
