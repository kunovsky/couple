class User < ActiveRecord::Base
  has_many :completed_questionnaires
  has_many :questionnaires, through: :completed_questionnaires
  has_many :actual_responses
end
