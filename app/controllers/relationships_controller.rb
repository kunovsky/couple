class RelationshipsController < ApplicationController
  include RelationshipHelpers
  def score
     render json: handle_relationship_scoring , status: 200
  end
end