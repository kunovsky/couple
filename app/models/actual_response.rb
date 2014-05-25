class ActualResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :possible_response
end
