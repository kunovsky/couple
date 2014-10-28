class PurchasesController < ApplicationController
  def create
    #TODO: Implement the integration with stripe
    render json: order_number, status: 200
  end

  private

  def order_number
    123456789
  end
end