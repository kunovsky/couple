module RelationshipHelpers
  include QuestionnaireScorer
  TYPES = {bad: "Individual Bad", ok: "Individual Ok", good: "Individual Good"}

  # relationship = User.find(params[:user_id]).relationship
  # relationship ||= create_relationship(params[:user_id])

  #check to see if both parters have taken the questionnaire
  #if there are not two partners then create a new relationship
  #with both members of the couple and duplicate the first 
  #partner's scores
  #create a score for each questionnaire

  def handle_relationship_scoring
    return score_against_existing_partner if current_user.relationship
    handle_scoring_against_dummy_partner
  end

  private

  def score_against_existing_partner
  end

  def handle_scoring_against_dummy_partner
    set_up_dummy_relationship
    score_against_dummy_partner
    #need to give the partner all good scores for each section
    #with only one user we can only give the user feedback about themselves
  end

  def set_up_dummy_relationship
    relationship = Relationship.create!
    Feedback.create!(relationship_id: relationship.id)
    current_user.update_attributes(relationship_id: relationship.id)
  end

  def score_against_dummy_partner
    overall_results = {}
    current_user.completed_questionnaires.each do |completed|
      questionnaire = Questionnaire.find(completed.questionnaire_id)
      if completed.score < questionnaire.cutoff_score
        overall_results[questionnaire.id] = individual_result(questionnaire.id, TYPES[:bad])
      elsif completed.score < questionnaire.ok_score
        overall_results[questionnaire.id] = individual_result(questionnaire.id, TYPES[:ok])
      else
        overall_results[questionnaire.id] = individual_result(questionnaire.id, TYPES[:good])
      end
    end
    update_relationship_feedback(overall_results)
  end

  def update_relationship_feedback(overall_results)
    current_user.relationship.feedback.update_attributes(analyses: overall_results)
  end

  def individual_result(id, type)
   Result.select(Result[:id]).where(
     Questionnaire[:id].eq(id).and(Result[:quadrant_type].eq(type))
   ).joins(Result.arel_table.join(Questionnaire.arel_table).on(
       Result[:questionnaire_id].eq(Questionnaire[:id])).join_sources).first.id
  end
end