class RelationshipsController < ApplicationController
  include RelationshipsHelper
  def score
     render json: handle_relationship_scoring , status: 200
  end
end