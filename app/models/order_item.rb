class OrderItem < ActiveRecord::Base
  belongs_to :order, :touch => true
  belongs_to :product
end
