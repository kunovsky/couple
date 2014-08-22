module RelationshipResults
  class Stat
    def initialize(params)
      @id, @relationship_id = params[:id], params[:relationship_id]
      @analyses = Relationship.find(@relationship_id).feedback.analyses
    end

    def handle_results_request
      response_id = @analyses[@id.to_s]["response_id"]
      percentage = @analyses[@id.to_s]["percentage"]
      {content: Result.find(response_id).content, percentage: percentage }
    end

    def present_result
      #result content
      #letter grade (a, b, or c)
      #number of questions they got right/ number of total questions for that survey (minimum is 70)
    end
  end
end