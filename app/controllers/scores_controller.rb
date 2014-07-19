class ScoresController < ApplicationController
  respond_to :json

  def score
    # relationship = User.find(params[:user_id]).relationship
    # relationship ||= create_relationship(params[:user_id])

    #check to see if both parters have taken the questionnaire
    #if there are not two partners then create a new relationship
    #with both members of the couple and duplicate the first 
    #partner's scores
    #create a score for each questionnaire
     render json: "working"
  end
end