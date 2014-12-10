class Admin::ProductsController < ApplicationController

  before_action :require_login
  before_action :require_admin
  skip_before_action :setup_cart

  before_action :find_product, only: [:show, :update]

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

    redirect_to admin_products_path
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def update
    @product.update(product_params)

    redirect_to admin_products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :qty, :logo_url)
  end

end
