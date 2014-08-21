class User < ActiveRecord::Base
  include UserHelpers
  has_many :completed_questionnaires
  has_one :actual_response
  belongs_to :relationship
end
