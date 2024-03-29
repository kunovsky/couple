module Scoring
  class Base
    TYPES = {bad: "individual_bad", ok: "individual_ok", good: "individual_good"}
    
    def initialize(current_user)
      @user, @partner_1_results, @overall_percentages, @last_id = current_user, {}, [], results_questionnaire_id
    end

    private

    def determine_results
      @user.completed_questionnaires.each do |completed|
        questionnaire = Questionnaire.find(completed.questionnaire_id)
        if completed.score["user_score"] < questionnaire.cutoff_score
          @partner_1_results[questionnaire.id] = result_and_product(questionnaire.id, :bad)
        elsif completed.score["user_score"] < questionnaire.ok_score
          @partner_1_results[questionnaire.id] = result_and_product(questionnaire.id, :ok)
        else
          @partner_1_results[questionnaire.id] = result_and_product(questionnaire.id, :good)
        end
        set_questionnaire_percentage(completed.score["percentage"], questionnaire.id)
        adjusted_percentage(completed.score["percentage"], questionnaire.weight)
      end
    end

    def result_and_product(id, type)
      result_id = individual_result_id(id, TYPES[type])
      {result_id: result_id, products_data: product_data(result_id)}
    end

    def individual_result_id(id, type)
     Result.select(Result[:id]).where(
       Questionnaire[:id].eq(id).and(Result[:quadrant_type].eq(type))
     ).joins(Result.arel_table.join(Questionnaire.arel_table).on(
         Result[:questionnaire_id].eq(Questionnaire[:id])).join_sources).first.id
    end

    def set_questionnaire_percentage(score, id)
      @partner_1_results[id][:percentage] = score
    end

    def adjusted_percentage(percentage, weight)
      @overall_percentages << ((percentage.to_f)/100)*weight
    end

    def overall_percentage
      @partner_1_results[@last_id] = {percentage: nil} unless @partner_1_results[@last_id]
      @partner_1_results[@last_id][:percentage] = calculate_overall_percentage
    end

    def calculate_overall_percentage
      length = @overall_percentages.length
      ((@overall_percentages.reduce(:+))*100).round
    end

    def overall_result_and_product
      if @partner_1_results[@last_id][:percentage] < 80
        @partner_1_results[@last_id].merge!(result_and_product(@last_id, :bad))
      elsif @partner_1_results[@last_id][:percentage] < 90
        @partner_1_results[@last_id].merge!(result_and_product(@last_id, :ok))
      else
        @partner_1_results[@last_id].merge!(result_and_product(@last_id, :good))
      end
    end

    def results_questionnaire_id
      APP_CONFIG[:last_questionnaire_id] + 1
    end

    def product_data(result_id)
      Product.select(Product[:id]).where(Result[:id].eq(result_id)).joins(treatments: :result).map {|product| product['id']}
    end

    def update_relationship_feedback(results)
      @user.update_attributes(taken: true)
      @user.relationship.feedback.update_attributes(analyses: results)
    end
  end
end