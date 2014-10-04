module Results
  class Content < Base

    def format_result
      {content: result_content,
       recommendation: result_recommendation,
       products_data: products_data.flatten,
       status: status,
     }
    end

    private

    def result_content
      result.content
    end

    def result_recommendation
      result.recommendation
    end

    def products_data
      return [] if @analysis['products_data'].empty?
      @analysis['products_data'].map {|id| Product.select(Product[:id], Product[:name], Product[:description], Product[:data]).where(Product[:id].eq(id))}
    end
  end
end