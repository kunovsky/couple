module ActualResponseHelpers

  def get_actual_response_count
    response_count = 0
    current_user.actual_response.responses.map {|response| response_count+= response[1].length}
    response_count
  end

  class Saver #TODO: Move this saver class into a service
    def initialize(params)
      @response_id, @question_id, @user_id = params[:response_id], params[:question_id], params[:user_id]
      @questionnaire_id = questionnaire_id
    end

    def process_actual_response
      responses = actual_response.responses
      responses[@questionnaire_id] = {} unless responses[@questionnaire_id]
      responses[@questionnaire_id][@question_id] = @response_id
      actual_response.update_attributes(responses: responses)
      grouping_completed?
    end

    private
    def questionnaire_id
      Question.find(@question_id).questionnaire.id.to_s
    end

    def actual_response
      User.find(@user_id).actual_response
    end

    def grouping_completed?
      return true if total_questions_in_grouping == actual_responses_count
    end

    def total_questions_in_grouping
     Question.select(:id).where(Grouping[:id].eq(grouping.id)).joins(questionnaire: :grouping).count
    end

    def actual_responses_count
      count = 0
      questionnaire_ids = grouping.questionnaires.pluck(:id)
      questionnaire_ids.each do |id|
        count += actual_response.responses[id.to_s].length if actual_response.responses[id.to_s]
      end
     count
    end

    def grouping
      Questionnaire.find(@questionnaire_id).grouping
    end
  end
end