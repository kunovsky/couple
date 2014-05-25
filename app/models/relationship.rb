class Relationship < ActiveRecord::Base
  has_many :users
  has_many :feedbacks
end
