class ApiV1::ProductsController < ApiController

  before_action :require_login

  def index
    @products = Product.page( params[:page] ).per(1)
  end

end
