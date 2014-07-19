class Feedback < ActiveRecord::Base
  belongs_to :relationship
  belongs_to :questionnaire
  belongs_to :result
end
