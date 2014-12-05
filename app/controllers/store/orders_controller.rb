class Store::OrdersController < ApplicationController

  before_action :require_login

  def index
    @orders = Order.page(params[:page]).per(5)
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.create( :user_id => current_user.id,
                          :address => params[:order][:address],
                          :amount => current_cart.amount )

    order.add_order_item(current_cart)

    session[:cart_id] = nil
    current_cart.destroy

    OrderMailer.confirm(current_user, order).deliver

    redirect_to store_orders_path
  end

end
