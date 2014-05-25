class Quadrant < ActiveRecord::Base
  belongs_to :survey
  belongs_to :result
end
