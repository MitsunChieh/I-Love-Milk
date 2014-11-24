class Store::ShoppingsController < ApplicationController

  def index
    @shopping = Shopping.where(status: :shopping)
  end

  def create
    @shopping = Shopping.create(product_id: params[:p_id], status: :shopping)

    redirect_to store_shoppings_path
  end

  # def photo_params
  #   params.require(:photo).permit(:img, :description)
  # end

end
