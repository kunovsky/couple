module RelationshipResults
  class Stat
    def initialize(params)
      @id, @relationship_id = params[:id], params[:relationship_id]
      @analyses = analyses
    end

    def handle_results_request
      {content: result_data(content), percentage_data: percentage_data, product_data: result_data(products)}
    end

    def analyses
      Relationship.find(@relationship_id).feedback.analyses
    end

    def result_data(type)
      Result.find(@analyses[@id]["result_id"]).type
    end

    def percentage_data
      @analyses[@id.to_s]["percentage"] || @analyses[@id.to_s]["percentages"]
    end
  end
end