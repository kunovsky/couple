class Relationship < ActiveRecord::Base
  has_many :users
  has_one :feedback
end
