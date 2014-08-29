class Product < ActiveRecord::Base
  has_many :treatments
  has_many :results, through: :treatments
end