class OrderItem < ActiveRecord::Base

  validates_presence_of :order_id, :product_id, :qty, :price

  belongs_to :order, :touch => true
  belongs_to :product

end
