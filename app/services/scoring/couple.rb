module Scoring
  class Couple < Base
    TYPES = {bad: "Couple Bad", good: "Couple Good", good_bad: "Couple Good Bad", bad_good: "Couple Bad Good"}
    #TODO: Create diagnosis for the couple which contain info related to how we are going to help them - products, reccomended actions

    def initialize
      super
      @second_partner_scores, @both_partner_results = second_partner_scores, {}
    end

    def handle_relationship_scoring
      determine_results
      overall_percentage
      overall_result
      score_partners_against_eachother
      #get each member of the couples completed questionnaires
        #partner 2's already exist in the relationship's feedbacks
        #partner 1's are calculated using determine_results
      #for each questionnaire for each person
      #that person's score is either good, bad, or ok
      #if both partner's score for the questionnaire is over the cutoff score then good
      #if both partner's score for the questionnaire is under the cutoff score then bad
      #if partner 1 is over but partner 2 is under then good bad
      #if partner 1 is under but partner 2 is over then bad good
      #save the new feedback analyses in place of the old ones
    end

    private

    def score_partners_against_eachother
      @overall_results.each do |partner_1_score|
        data = both_partners_data(partner_1_score)
        number = partner_1_score.first
        if check_for_bad_score(data)
          @both_partner_results[number] = check_for_bad_score(data) 
        elsif check_for_ok_score(data)
          @both_partner_results[number] = check_for_ok_score(data)
        else
          @both_partner_results[number] = check_for_good_score(data) 
        end
      end
    end

    def check_for_bad_score
      #bad good
      #bad bad
      #bad ok
      return nil
    end

    def check_for_ok_score
        #ok good
        #ok bad
        #ok ok
      return nil
    end

    def check_for_good_score
      #good good
      #good bad
      #good ok
      return nil
    end

    def second_partner_scores
      @user.relationship.feedback.analyses
    end

    def both_partners_data(score)
      number = questionnaire_number(score)
      partner_1_score = lookup_response(score)
      partner_2_score = lookup_response(@second_partner_scores[number])
      {partner_1_score: partner_1_score, partner_2_score: partner_2_score}
    end

    def lookup_response(score)
      Result.find(score[1]["response_id"]).quadrant_type
    end

    def questionnaire_number(score)
      score.first.to_s
    end
  end
end