class Store::CartsController < ApplicationController

  before_action :setup_cart
  before_action :find_product, only: [:create]

  def index
    current_cart
  end

  def create
    if @cart.can_add_product?(@product.id, qty)
      @cart.add_cartItem(@product.id, qty)
      @product.qty -= qty
      @product.save

      redirect_to store_carts_path

    else
      respond_to do |format|
        format.html { redirect_to :back }
        format.js {  }
      end
    end

  end

  private

  def find_product
    @product = Product.find(params[:p_id])
  end

  def qty
    params[:cart_item][:qty].to_i
  end

end
