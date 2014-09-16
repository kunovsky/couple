module QuestionnaireHelpers

  def select_and_format_all_questionnaires(grouping_id)
    all_questions = []
    Grouping.find(grouping_id).questionnaires.each do |questionnaire|
      all_questions << format_questionnaire(questionnaire.id)
    end
    all_questions.flatten
  end

  def format_questionnaire(id)
    questions = get_questions(id)
    possible_responses = get_possible_responses(id)
    questions.map {|question| {id: question.id, questionnaire_id: id, content: question.content, possible_responses: format_possible_responses(possible_responses)}}
  end

  def format_possible_responses(possible_responses)
    possible_responses.map {|response| {id: response.id, content: response.content}}
  end

  def get_questions(id)
    Questionnaire.find(id).questions
  end

  def get_possible_responses(id)
    PossibleResponse.select(
      PossibleResponse[:id], PossibleResponse[:content]
      ).where(Questionnaire[:id].eq(id)).joins( questions_responses: {question: :questionnaire}
      ).order(PossibleResponse[:id]).group(PossibleResponse[:id])
  end
end