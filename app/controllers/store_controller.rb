class StoreController < ApplicationController

  def index
    @cart_item = CartItem.new
    @products = Product.page(params[:page]).per(4)
  end

end
