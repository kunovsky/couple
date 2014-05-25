class Result < ActiveRecord::Base
  has_many :feedbacks
  has_many :quadrants
end
