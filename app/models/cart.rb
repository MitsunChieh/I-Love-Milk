class Cart < ActiveRecord::Base
  has_many :cart_items

  def can_add_product?(p_id, qty)
    Product.find(p_id).qty >= qty
  end

  def add_cartItem(p_id, price, qty)
    unless same_product_in_cart?(p_id)
      CartItem.create(   cart_id: self.id,
                      product_id: p_id,
                             qty: qty)
    else
      cartItem = find_cartItem(p_id)
      cartItem.qty +=qty
      cartItem.save
    end
    self.amount += price*qty
    self.save
  end

  def remove_cartItem(p_id)
    i = find_cartItem(p_id)
    self.amount -= i.product.price*i.qty
    self.save
    i.destroy
  end

  private

  def same_product_in_cart?(p_id)
    find_cartItem(p_id)
  end

  def find_cartItem(p_id)
    cart_items.where(product_id: p_id).first
  end

end