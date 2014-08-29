class Treatment < ActiveRecord::Base
  belongs_to :result
  belongs_to :product
end
