class RelationshipsController < ApplicationController
  include RelationshipHelpers
  def score
     render json: handle_relationship_scoring , status: 200
  end
end

#TODO: the overall result and the individual results will have two measurements -- the good enough measurement and then a percentage
#which is the ammount of items overall that were answered incorrectley

#TODO: when the first user of a couple is taking the questionnaire we will give back feedback to them
#that is either good, ok, or bad. We need to create these different feedbacks