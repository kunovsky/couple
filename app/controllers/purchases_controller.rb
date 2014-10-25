class PurchasesController < ApplicationController
  def create
    #TODO: Implement the integration with stripe
    render json: {success: true}, status: 200
  end
end