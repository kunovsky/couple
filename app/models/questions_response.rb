class QuestionsResponse < ActiveRecord::Base
  belongs_to :question
  belongs_to :possible_response
end
