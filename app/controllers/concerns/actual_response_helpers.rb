module ActualResponseHelpers
  class Saver
    def initialize(params)
      @response_id, @question_id, @questionnaire_id, @user_id = params[:response_id], params [:question_id], params[:questionnaire_id], params[:user_id]
    end

    def process_actual_response
      responses = actual_response.responses
      responses[@questionnaire_id] = {} unless responses[@questionnaire_id]
      responses[@questionnaire_id][@question_id] = @response_id
      actual_response.update_attributes(responses: responses)
      questionnaire_completed?
    end

    private
    def actual_response
      User.find(@user_id).actual_response
    end

    def questionnaire_completed?
      return true if Questionnaire.find(@questionnaire_id).questions.count == actual_responses_count
      false
    end

    def actual_responses_count
      actual_response.responses[@questionnaire_id].length
    end
  end
end