class Result < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :treatments
  has_many :products, through: :treatments
end
