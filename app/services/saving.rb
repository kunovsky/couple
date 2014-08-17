module Saving
  class ActualResponseSaving
    def initialize(params)
      @response_id, @question_id, @questionnaire_id, @user_id = params[:response_id], params [:question_id], params[:questionnaire_id], params[:user_id]
    end

    def process_actual_response
      responses = actual_response.responses
      responses[@questionnaire_id] = {} unless responses[@questionnaire_id]
      responses[@questionnaire_id][@question_id] = @response_id
      actual_response.update_attributes(responses: responses)
    end

    def actual_response
      User.find(@user_id).actual_response
    end
  end
end