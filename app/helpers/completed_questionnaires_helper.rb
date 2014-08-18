module CompletedQuestionnairesHelper
  class Handler

    def initialize(params)
      @questionnaire_id, @user_id = params[:questionnaire_id], params[:user_id]
      @point_values = format_possible_responses_and_point_values
    end

    def handle_questionnaire
      CompletedQuestionnaire.find_or_create_by( user_id: @user_id, questionnaire_id: @questionnaire_id) do |completed|
        completed.score = tabulate_score
      end
    end

    private

    def tabulate_score
      responses = User.find(@user_id).actual_response.responses[@questionnaire_id]
      responses.values.map {|value| @point_values[value.to_i]}.reduce(:+)
    end

    def format_possible_responses_and_point_values
      hash = Hash.new
      responses_and_point_values.map {|response|hash[response.id] = response.point_value}
      hash
    end

    def responses_and_point_values
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