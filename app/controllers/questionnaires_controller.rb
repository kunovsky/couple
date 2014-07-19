class QuestionnairesController < ApplicationController

  def show
    questionnaire = Questionnaire.find(params[:id]).questions
    render json: questionnaire
    render json: report_by_date(:top_products)
  end
end

SELECT questions.id, possible_responses.id,
FROM questions
INNER JOIN questionnaires on questionnaires.id = questions. 