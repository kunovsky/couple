module RelationshipHelpers
  include QuestionnaireScorer

  # relationship = User.find(params[:user_id]).relationship
  # relationship ||= create_relationship(params[:user_id])

  #check to see if both parters have taken the questionnaire
  #if there are not two partners then create a new relationship
  #with both members of the couple and duplicate the first 
  #partner's scores
  #create a score for each questionnaire

  def handle_relationship_scoring
    return score_against_existing_partner if current_user.repationship
    score_against_dummy_partner
  end

  private

  def score_against_existing_partner
  end

  def score_against_dummy_partner
    set_up_dummy_relationship
    #need to give the partner all good scores for each section
    #with only one user we can only give the user feedback about themselves
  end

  def set_up_dummy_relationship
    relationship = Relationship.create!
    current_user.update_attributes(relationship_id: relationship.id)
    partner = User.create!(relationship_id: relationship.id)
    ActualResponse.create!(user_id: partner.id, responses: perfect_responses)
  end
end

#define perfect_responses