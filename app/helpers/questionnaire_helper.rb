module QuestionnaireHelper

  def format_questionnaire(id)
    questions = get_questions(id)
    questions.map {|question| {id: question.id, content: question.content, possible_responses: format_possible_responses(question)}}
  end

  def format_possible_responses(question)
    possible_responses = question.possible_responses
    possible_responses.map {|response| {id: response.id, content: response.content}}
  end

  def get_questions(id)
    Questionnaire.find(id).questions
  end
end