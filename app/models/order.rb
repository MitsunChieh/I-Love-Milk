class Order < ActiveRecord::Base

  validates_presence_of :user_id, :amount, :address

  belongs_to :user
  has_many :order_items, dependent: :destroy

  def add_order_item(cart)
    cart.cart_items.each do |i|
      @product = Product.find(i.product_id)
      OrderItem.create(  order_id: self.id,
                       product_id: i.product_id,
                              qty: i.qty,
                            price: @product.price)
      @product.qty -= i.qty
      @product.save
    end
  end

end
