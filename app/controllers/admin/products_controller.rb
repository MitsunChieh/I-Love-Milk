class Admin::ProductsController < ApplicationController

  before_action :require_login
  before_action :require_admin
  skip_before_action :setup_cart

  def index
    @products = Product.page(params[:page]).per(5)
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.js
    end

  end

  def create
    @product = Product.create(product_params)

    respond_to do |format|
      format.js
    end

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :qty)
  end

end
