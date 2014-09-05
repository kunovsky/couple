class Questionnaire < ActiveRecord::Base
  has_many :questions
  has_many :results
  belongs_to :grouping
end
