class Store::ProductsController < ApplicationController

  before_action :find_product, only: [:show]

  def show
    @cart_item = CartItem.new
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

end