module Results
  class InviteStatus < Base
    
    def initialize(user_id)
      @user = User.find(user_id)
      @analysis = analysis(last_result_id)
    end

    def invite_status
      {partner_invited: partner_invited?, partner_taken: partner_taken?}
    end

    private
    def partner_invited?
      true if @user.relationship.users.length == 2
    end

    def partner_taken?
      true if @analysis.fetch('percentages', nil)
    end

    def last_result_id
      (APP_CONFIG[:last_questionnaire_id] + 1).to_s
    end
  end
end