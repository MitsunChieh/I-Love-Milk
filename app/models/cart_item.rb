class CartItem < ActiveRecord::Base

  validates_presence_of :qty
  validates_numericality_of :qty, only_integer: true, greater_than: 0

  belongs_to :cart, :touch => true
  belongs_to :product

end
