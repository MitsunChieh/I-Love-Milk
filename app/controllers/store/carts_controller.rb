class Store::CartsController < ApplicationController

  def index
  end

  def create
    @cart = Cart.create
    CartItem.create(cart_id: @cart.id,
                        product_id: params[:p_id],
                        qty: params[:cart_item][:qty])

    redirect_to store_carts_path
  end

end
