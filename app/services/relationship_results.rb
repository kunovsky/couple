module RelationshipResults
  class Stat
    def initialize(params, relationship)
      @analysis = analysis(params, relationship)
    end

    def handle_results_request
      {content: result_content, recommendation: result_recommendation, percentage_data: percentage_data, products_data: products_data, status: status }

    end

    private

    def analysis(params, relationship)
      relationship.feedback.analyses[params[:id]]
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
      return @analysis["percentages"] if @analysis["percentages"]
      {partner_1_percentage: @analysis["percentage"]}
    end

    def products_data
      Product.select(Product[:id], Product[:name], Product[:description], Product[:data]
        ).where(Result[:id].eq(@analysis["result_id"])).joins(treatments: :result)
    end

    def result
      @result ||= Result.find(@analysis["result_id"])
    end
  end
end