module QuestionnaireHelper

  def format_questionnaire(id)
    questions = get_questions(id)
    possible_responses = get_possible_responses(id)
    questions.map {|question| {id: question.id, content: question.content, possible_responses: format_possible_responses(possible_responses)}}
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
    ).where(Questionnaire[:id].eq(id)).joins(
      PossibleResponse.arel_table.join(QuestionsResponse.arel_table).on(
        QuestionsResponse[:possible_response_id].eq(PossibleResponse[:id])
      ).join_sources
    ).joins(
      PossibleResponse.arel_table.join(Question.arel_table).on(
        QuestionsResponse[:question_id].eq(Question[:id])
      ).join_sources
    ).joins(
      PossibleResponse.arel_table.join(Questionnaire.arel_table).on(
        Question[:questionnaire_id].eq(Questionnaire[:id])
      ).join_sources
    ).order(PossibleResponse[:id]).group(PossibleResponse[:id])
  end
end

