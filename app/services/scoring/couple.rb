module Scoring
  class Couple < Base
    #TODO: Add couple types and types to a types module and include them
    COUPLE_TYPES = {  good_good: "couple_good_good",
                      good_bad: "couple_good_bad",
                      good_ok: "couple_good_ok",
                      bad_bad: "couple_bad_bad",
                      bad_ok: "couple_bad_ok",
                      bad_good: "couple_bad_good",
                      ok_good: "couple_ok_good",
                      ok_bad: "couple_ok_bad",
                      ok_ok: "couple_ok_ok"}
    
    def initialize(args)
      super(args)
      @partner_2_results, @both_partner_results = partner_2_results, {}
    end

    def handle_relationship_scoring
      determine_results
      overall_percentage
      overall_result
      score_partners_against_each_other
      update_relationship_feedback(@both_partner_results)
    end

    private

    def partner_2_results
      @user.relationship.feedback.analyses
    end

    def score_partners_against_each_other
      @partner_1_results.each do |partner_1_score|
        scores = both_partners_scores(partner_1_score)
        percentages = both_partners_percentages(partner_1_score)
        if check_for_bad_score(scores)
          @both_partner_results[scores[:id]] = check_for_bad_score(scores) 
        elsif check_for_ok_score(scores)
          @both_partner_results[scores[:id]]  = check_for_ok_score(scores)
        else
          @both_partner_results[scores[:id]]  = check_for_good_score(scores) 
        end
        set_couple_questionnaire_percentages(scores[:id], percentages)
      end
    end

    def check_for_bad_score(scores)
      if scores[:partner_1_score] == TYPES[:bad] && scores[:partner_2_score] == TYPES[:bad]
        return couple_result(scores[:id], :bad_bad)
      elsif scores[:partner_1_score] == TYPES[:bad] && scores[:partner_2_score] == TYPES[:good]
        return couple_result(scores[:id], :bad_good)
      elsif scores[:partner_1_score] == TYPES[:bad] && scores[:partner_2_score] == TYPES[:ok]
        return couple_result(scores[:id], :bad_ok)
      else
        return nil
      end
    end

    def check_for_ok_score(scores)
      if scores[:partner_1_score] == TYPES[:ok] && scores[:partner_2_score] == TYPES[:good]
        return couple_result(scores[:id], :ok_good)
      elsif scores[:partner_1_score] == TYPES[:ok] && scores[:partner_2_score] == TYPES[:bad]
        return couple_result(scores[:id], :ok_bad)
      elsif scores[:partner_1_score] == TYPES[:ok] && scores[:partner_2_score] == TYPES[:ok]
        return couple_result(scores[:id], :ok_ok)
      else
        return nil
      end
    end

    def check_for_good_score(scores)
      if scores[:partner_1_score] == TYPES[:good] && scores[:partner_2_score] == TYPES[:good]
        return couple_result(scores[:id], :good_good)
      elsif scores[:partner_1_score] == TYPES[:good] && scores[:partner_2_score] == TYPES[:bad]
        return couple_result(scores[:id], :good_bad)
      elsif scores[:partner_1_score] == TYPES[:good] && scores[:partner_2_score] == TYPES[:ok]
        return couple_result(scores[:id], :good_ok)
      else
        return nil
      end
    end

    def both_partners_scores(score)
      id = questionnaire_number(score)
      partner_1_score = lookup_response(score[1])
      partner_2_score = lookup_response(@partner_2_results[id])
      {id: id, partner_1_score: partner_1_score, partner_2_score: partner_2_score}
    end

    def lookup_response(score)
      score = score[:result_id] || score["result_id"]
      Result.find(score).quadrant_type
    end

    def both_partners_percentages(score)
      id = questionnaire_number(score)
      partner_1_score = lookup_percentage(score[1])
      partner_2_percentage = lookup_percentage(@partner_2_results[id])
      {partner_1_percentage: partner_1_score, partner_2_percentage: partner_2_percentage}
    end

    def lookup_percentage(score)
      score[:percentage] || score["percentage"]
    end

    def questionnaire_number(score)
      score.first.to_s
    end

    def couple_result(id, type)
      {result_id: individual_result_id(id, COUPLE_TYPES[type])}
    end

    def set_couple_questionnaire_percentages(id, percentages)
      @both_partner_results[id][:percentages] = percentages
    end
  end
end