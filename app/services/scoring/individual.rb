module Scoring
  class Individual < Base

    def handle_relationship_scoring
      set_up_dummy_relationship
      determine_results
      overall_percentage
      overall_result_and_product
      update_relationship_feedback(@partner_1_results)
    end

    private

    def set_up_dummy_relationship
      relationship = Relationship.create!
      Feedback.create!(relationship_id: relationship.id)
      @user.update_attributes(relationship_id: relationship.id)
    end
  end
end