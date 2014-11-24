class Store::ProductsController < ApplicationController

  before_action :find_product, only: [:show]

  def show
    @shopping = Shopping.new
  end

  def find_product
    @product = Product.find(params[:id])
  end

end