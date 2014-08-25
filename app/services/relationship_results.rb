module RelationshipResults
  class Stat
    def initialize(params)
      @id, @relationship_id = params[:id], params[:relationship_id]
    end

    def handle_results_request
      p analyses
      response_id, percentage = analyses[@id]["response_id"], analyses[@id.to_s]["percentage"]
      {content: Result.find(response_id).content, percentage: percentage }
    end

    def analyses
      @analyses ||= Relationship.find(@relationship_id).feedback.analyses
    end
  end
end