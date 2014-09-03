module RelationshipResults
  class Stat
    def initialize(result_id, user_id)
      @user = User.find(user_id)
      @analysis = analysis(result_id)
    end

    def handle_results_request
      {content: result_content, recommendation: result_recommendation, percentage_data: percentage_data, products_data: products_data, status: status }

    end

    private

    def analysis(result_id)
      @user.relationship.feedback.analyses[result_id]
    end

    def result_content
      result.content
    end

    def result_recommendation
      result.recommendation
    end

    def status
      result.overall
    end

    def percentage_data
      return format_percentages(@analysis["percentages"])if @analysis.fetch("percentages", nil)
      {current_user_percentage: @analysis["percentage"]}
    end

    def products_data
      Product.select(Product[:id], Product[:name], Product[:description], Product[:data]
        ).where(Result[:id].eq(@analysis["result_id"])).joins(treatments: :result)
    end

    def result
      @result ||= Result.find(@analysis["result_id"])
    end

    def format_percentages(percentages)
      {current_user_percentage: percentages[@user.id.to_s], partner_percentage: percentages[partner_id]}
    end

    def partner_id
      #TODO: Make this nice
      @user.relationship.users.pluck(:id).reject! {|user| user == @user.id}.first.to_s
    end
  end
end