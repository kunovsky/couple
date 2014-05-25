class User < ActiveRecord::Base
  has_many :completed_surveys
  has_many :surveys, through: :completed_surveys
end
