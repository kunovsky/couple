module GroupingHelpers

  #TODO: change this method to use map instead of an each
  def select_and_format_all_questionnaires(grouping_id)
    question_data = {questions: [], actual_responses: [], total_answered: get_actual_response_count}
    Grouping.find(grouping_id).questionnaires.each do |questionnaire|
      question_data[:questions] << format_questionnaire(questionnaire.id)
      question_data[:actual_responses] = get_actual_responses(questionnaire.id)
    end
    question_data[:questions].flatten!
    question_data
  end

  def format_questionnaire(id)
    get_questions(id).map {|question| {id: question.id, questionnaire_id: id, content: question.content, possible_responses: format_possible_responses(get_possible_responses(id))}}
  end

  def format_possible_responses(possible_responses)
    possible_responses.map {|response| {id: response.id, content: response.content}}
  end

  def get_questions(id)
    Questionnaire.find(id).questions
  end

  def get_possible_responses(id)
    PossibleResponse.select(PossibleResponse[:id], PossibleResponse[:content]
      ).where(Questionnaire[:id].eq(id)).joins( questions_responses: {question: :questionnaire}
      ).order(PossibleResponse[:id]).group(PossibleResponse[:id])
  end

  def get_actual_responses(id)
    current_user.actual_response.responses[id.to_s]
  end

  def get_actual_response_count
    response_count = 0
    current_user.actual_response.responses.map {|response| response_count+= response[1].length}
    response_count
  end
end