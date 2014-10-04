module Results
  class Base
    
    def initialize(result_id, user_id)
      @user = User.find(user_id)
      @analysis = analysis(result_id)
    end

    private

    def analysis(result_id)
      @user.relationship.feedback.analyses[result_id]
    end

    def result
      return @result ||= Result.find(@analysis['result_id']) if @analysis['result_id']
      @result ||= Result.find(@analysis['results'][@user.id.to_s]) if Result.exists?(@analysis['results'][@user.id.to_s])
    end

    def status
      result.overall
    end
  end
end