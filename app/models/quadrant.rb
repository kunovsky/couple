class Quadrant < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :result
end
