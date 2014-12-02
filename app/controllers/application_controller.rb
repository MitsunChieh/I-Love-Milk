class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user

  protect_from_forgery with: :exception

  before_action :setup_cart

  helper_method :current_cart

  protected

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def setup_cart
    Rails.logger.debug("setup_cart!")
    if session[:cart_id]
      Rails.logger.debug("Existed CART! #{session[:cart_id]}")
      @cart = Cart.find(session[:cart_id])
    else
      Rails.logger.debug("New CART!")
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    Rails.logger.debug(@cart.inspect)
  end

  def current_cart
    Rails.logger.debug('current_cart')
    Rails.logger.debug(@cart.inspect)
    @cart
  end

end
