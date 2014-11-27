class Store::OrdersController < ApplicationController

  def index
    @order = Order.page(params[:page]).per(5)
  end

  def create
    cart = Cart.find(params[:cart_id])
    order = Order.create()
    cart.cart_items.each do |i|
      order.order_items.create(product_id: i.product_id,
                                qty: i.qty,
                                price: Product.find(i.product_id).price)

    end

    redirect_to store_orders_path
  end

end
