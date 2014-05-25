class Survey < ActiveRecord::Base
  has_many :completed_surveys
  has_many :users, through: :completed_surveys
  has_many :questions
  has_many :quadrants
end
