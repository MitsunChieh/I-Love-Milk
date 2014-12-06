class CartItem < ActiveRecord::Base

  validates_presence_of :cart_id, :product_id, :qty
  validates_numericality_of :qty, only_integer: true, greater_than: 0

  belongs_to :cart, :touch => true
  belongs_to :product

end
