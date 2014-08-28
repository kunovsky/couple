module RelationshipResults
  class Stat
    def initialize(params)
      @id, @relationship_id = params[:id], params[:relationship_id]
    end

    def handle_results_request
      result_id, percentage = analyses[@id]["result_id"], analyses[@id.to_s]["percentage"]
      {content: Result.find(result_id).content, percentage: percentage }
    end

    def analyses
      @analyses ||= Relationship.find(@relationship_id).feedback.analyses
    end
  end
end