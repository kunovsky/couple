module ActualResponseHelper
  def update_actual_responses(params)
    user = User.find(params[:user_id])
    formatted_responses = format_responses(params)
    user.actual_responses.merge! formatted_responses
  end

  def format_responses(params)
    #start work here
    questionnaire_id = Question.find(params[:question_id]).questionnaire.id
    hash = {questionnaire_id: questionnaire_id, question_id: params[:question_id], response_id: params[:response_id]}
  end
end