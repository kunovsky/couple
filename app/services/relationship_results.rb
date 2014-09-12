module RelationshipResults
  class Stat
    def initialize(result_id, user_id)
      @user = User.find(user_id)
      @analysis = analysis(result_id)
    end

    def handle_results_request
      {content: result_content, recommendation: result_recommendation, percentage_data: percentage_data, products_data: products_data.flatten, status: status}
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
      return format_percentages(@analysis['percentages'])if @analysis.fetch('percentages', nil)
      {current_user_percentage: @analysis['percentage']}
    end

    def products_data
      return [] if @analysis['products_data'].empty?
      @analysis['products_data'].map {|id| Product.select(Product[:id], Product[:name], Product[:description], Product[:data]).where(Product[:id].eq(id))}
    end

    def result
      return @result ||= Result.find(@analysis['result_id']) if @analysis['result_id']
      @result ||= Result.find(@analysis['results'][@user.id.to_s]) if Result.exists?(@analysis['results'][@user.id.to_s])
    end

    def format_percentages(percentages)
      {current_user_percentage: percentages[@user.id.to_s], partner_percentage: percentages[partner_id]}
    end

    def partner_id
      @user.relationship.users.where(User[:id].not_eq(@user.id)).first.id.to_s
    end
  end
end