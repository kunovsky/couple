class Feedback < ActiveRecord::Base
  belongs_to :relationship
  belongs_to :survey
  belongs_to :result
end
