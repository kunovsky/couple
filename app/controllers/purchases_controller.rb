class PurchasesController < ApplicationController
  def create
    #TODO: Implement the integration with stripe
    render json: {instant_access: instant_access, product_id: params[:id]}, status: 200
  end

  private

  def instant_access
    params[:id] == "9"
  end
end