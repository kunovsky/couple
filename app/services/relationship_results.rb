module RelationshipResults
  class Stat
    def initialize(params)
      @analysis = analysis(params)
    end

    def handle_results_request
      {content: result_content, recommendation: result_recommendation, percentage_data: percentage_data, products_data: products_data, status: status }

    end

    private

    def analysis(params)
      Relationship.find(params[:relationship_id]).feedback.analyses[params[:id]]
    end

    def result_content
      Result.find(@analysis["result_id"]).content
    end

    def result_recommendation
      Result.find(@analysis["result_id"]).recommendation
    end

    def status
      Result.find(@analysis["result_id"]).overall
    end

    def percentage_data
      return @analysis["percentages"] if @analysis["percentages"]
      {partner_1_percentage: @analysis["percentage"]}
    end

    def products_data
      Product.select(Product[:id], Product[:name], Product[:description], Product[:data]
        ).where(Result[:id].eq(@analysis["result_id"])).joins(treatments: :result)
    end
  end
end