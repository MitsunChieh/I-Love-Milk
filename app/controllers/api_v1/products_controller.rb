class ApiV1::ProductsController < ApiController

  def index
    @products = Product.page( params[:page] ).per(5)
  end

end
