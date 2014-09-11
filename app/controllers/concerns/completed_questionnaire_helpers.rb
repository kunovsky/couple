module CompletedQuestionnaireHelpers
  class Handler

    def initialize(params)
      @grouping_id, @user_id = params[:grouping_id], params[:user_id]
    end

    def handle_questionnaires
      Grouping.find(@grouping_id).questionnaires.each do |questionnaire|
        @questionnaire_id = questionnaire.id.to_s
        @point_values = format_possible_responses_and_point_values
        @score = tabulate_score
        CompletedQuestionnaire.find_or_create_by( user_id: @user_id, questionnaire_id: @questionnaire_id).tap do |completed|
          completed.score = {user_score: @score, percentage: overall_percentage}
          completed.save!
        end
      end
    end

    private

    def tabulate_score
      user_responses.values.map {|value| @point_values[value.to_i]}.reduce(:+)
    end

    def user_responses
      User.find(@user_id).actual_response.responses[@questionnaire_id]
    end

    def format_possible_responses_and_point_values
      hash = Hash.new
      responses_and_point_values.map {|response|hash[response.id] = response.point_value}
      hash
    end

    def overall_percentage
      ((@score/greatest_response_value.to_f) *100).round
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

    def greatest_response_value
      @point_values.values.max * question_count
    end

    def question_count
      Questionnaire.find(@questionnaire_id).questions.count
    end
  end
end