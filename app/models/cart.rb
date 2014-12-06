class Cart < ActiveRecord::Base

  validates_presence_of :amount, :qty

  has_many :cart_items, dependent: :destroy

  def can_add_product?(product, qty)
    qty_difference(product, qty) >= qty && qty >= 0
  end

  def qty_difference(product, qty)
    product.qty - ( find_cart_item(product).try(:qty) || 0 )
  end

  def add_cart_item(product, qty)
    unless same_product_in_cart?(product)
      CartItem.create(     cart: self,
                        product: product,
                            qty: qty)
    else
      cart_item = find_cart_item(product)
      cart_item.qty += qty
      cart_item.save
    end
    self.amount += product.price * qty
    self.qty += qty
    self.save
  end

  def remove_cart_item(product)
    i = find_cart_item(product)
    self.amount -= i.product.price * i.qty
    self.qty -= i.qty
    self.save
    i.destroy
  end

  private

  def same_product_in_cart?(product)
    !!find_cart_item(product)
  end

  def find_cart_item(product)
    cart_items.where( product: product ).first
  end

end
