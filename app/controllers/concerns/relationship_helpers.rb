module RelationshipHelpers
  class RelationshipScorer
    TYPES = {bad: "Individual Bad", ok: "Individual Ok", good: "Individual Good"}

    def initialize(current_user)
      @user, @overall_results, @overall_percentages, @last_id = current_user, {}, [], results_questionnaire_id
    end

    def handle_relationship_scoring
      return score_against_existing_partner if @user.relationship
      handle_scoring_against_dummy_partner
    end

    private

    def score_against_existing_partner
    end

    def handle_scoring_against_dummy_partner
      set_up_dummy_relationship
      determine_results
      overall_percentage
      overall_result
      update_relationship_feedback
    end

    def set_up_dummy_relationship
      relationship = Relationship.create!
      Feedback.create!(relationship_id: relationship.id)
      @user.update_attributes(relationship_id: relationship.id)
    end

    def determine_results
      @user.completed_questionnaires.each do |completed|
        questionnaire = Questionnaire.find(completed.questionnaire_id)
        if completed.score["user_score"] < questionnaire.cutoff_score
          @overall_results[questionnaire.id] = id_hash(questionnaire.id, :bad)
        elsif completed.score["user_score"] < questionnaire.ok_score
          @overall_results[questionnaire.id] = id_hash(questionnaire.id, :ok)
        else
          @overall_results[questionnaire.id] = id_hash(questionnaire.id, :good)
        end
        set_questionnaire_percentage(completed.score["percentage"], questionnaire.id)
        adjusted_percentage(completed.score["percentage"], questionnaire.weight)
      end
    end

    def id_hash(id, type)
      {response_id: individual_result_id(id, TYPES[type])}
    end

    def individual_result_id(id, type)
     Result.select(Result[:id]).where(
       Questionnaire[:id].eq(id).and(Result[:quadrant_type].eq(type))
     ).joins(Result.arel_table.join(Questionnaire.arel_table).on(
         Result[:questionnaire_id].eq(Questionnaire[:id])).join_sources).first.id
    end

    def set_questionnaire_percentage(score, id)
      @overall_results[id][:percentage] = score
    end

    def adjusted_percentage(percentage, weight)
      adjusted = ((percentage.to_f)/100)*weight
      @overall_percentages.push(adjusted)
    end

    def overall_percentage
      @overall_results[@last_id] = {percentage: nil} unless @overall_results[@last_id]
      @overall_results[@last_id][:percentage] = calculate_overall_percentage
    end

    def calculate_overall_percentage
      length = @overall_percentages.length
      ((@overall_percentages.reduce(:+))*100).round
    end

    def update_relationship_feedback
      @user.relationship.feedback.update_attributes(analyses: @overall_results)
    end

    def overall_result
      if @overall_results[@last_id][:percentage] < 80
        @overall_results[@last_id][:response_id] = individual_result_id(@last_id, TYPES[:bad])
      elsif @overall_results[@last_id][:percentage] < 90
        @overall_results[@last_id][:response_id] = individual_result_id(@last_id, TYPES[:ok])
      else
        @overall_results[@last_id][:response_id] = individual_result_id(@last_id, TYPES[:good])
      end
    end

    def results_questionnaire_id
      APP_CONFIG[:last_questionnaire_id] + 1
    end
  end
end