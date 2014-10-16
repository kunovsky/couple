class ProductsController < ApplicationController
  def index
    @products = Product.all.select {|p|p.data['showcase']}
    render json: @products, status: 200
  end

  def show
    
  end
end