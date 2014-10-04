module Results
  class Scores < Base

    def format_result
      {percentage_data: percentage_data, status: status,}
    end

    private

    def percentage_data
      return format_percentages(@analysis['percentages'])if @analysis.fetch('percentages', nil)
      {current_user_percentage: @analysis['percentage']}
    end

    def format_percentages(percentages)
      {current_user_percentage: percentages[@user.id.to_s], partner_percentage: percentages[partner_id]}
    end
    
    def partner_id
      @user.relationship.users.where(User[:id].not_eq(@user.id)).first.id.to_s
    end
  end
end