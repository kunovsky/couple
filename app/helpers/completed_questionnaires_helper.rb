module CompletedQuestionnairesHelper
  class Handler

    def initialize(params)
      @questionnaire_id, @user_id = params[:questionnaire_id], params[:user_id]
    end

    def handle_questionnaire
      p"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      p possible_response_point_values
    end

    private

    def completed_questionnaire
      CompletedQuestionnaire.update_or_create_by_user_id_and_questionnaire_id() do |completed|
        completed.score = set_score
      end
    end

    def set_score
      responses = User.find(@user_id).actual_response.responses[@questionnaire_id]
      responses.values
      #responses[@questionnaire_id].values.map {|value| value.to_i}.reduce(:+)
    end

    def possible_response_point_values
      PossibleResponse.select(
        PossibleResponse[:id], PossibleResponse[:point_value]
      ).where(Questionnaire[:id].eq(@questionnaire_id)).joins(
        PossibleResponse.arel_table.join(QuestionsResponse.arel_table).on(
          QuestionsResponse[:possible_response_id].eq(PossibleResponse[:id])
        ).join_sources
      ).joins(
        PossibleResponse.arel_table.join(Question.arel_table).on(
          Question[:id].eq(QuestionsResponse[:question_id])
        ).join_sources
      ).joins(
        PossibleResponse.arel_table.join(Questionnaire.arel_table).on(
          Questionnaire[:id].eq(Question[:questionnaire_id])
        ).join_sources
      ).uniq
    end
  end
end

# SELECT possible_responses.id, possible_responses.point_value
# from possible_responses
# INNER JOIN questions_responses on questions_responses.possible_response_id = possible_responses.id
# INNER JOIN questions on questions.id = questions_responses.questionnaire_id
# INNER JOIN questionnaires on questionnaires.id = questions.questionnaire_id
# WHERE questionnaires.id = 1