class Store::CartsController < ApplicationController

  # before_action :setup_cart
  # before_action :current_cart
  before_action :find_product, only: [:create, :destroy]

  def show
    current_cart
  end

  def create
    setup_cart

    if @cart.can_add_product?(@product.id, qty)
      @cart.add_cartItem(@product.id, @product.price, qty)
      # @product.qty -= qty
      @product.save

      @success = true
    else
      @success = false
      q = @cart.qty_differ(@product.id, qty)
      if qty < 0
        @message = "請輸入正數"
      elsif q == 0
        @message = "單品數量已達庫存上限"
      else
        @message = "庫存量不足，最多可再加入#{q}瓶"
      end
    end

    respond_to do |format|
      format.html { redirect_to store_cart_path }
      format.js
    end

  end

  def destroy
    @pid = params[:p_id]
    current_cart.remove_cartItem(@pid)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
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
