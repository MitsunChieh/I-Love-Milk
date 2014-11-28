require 'rails_helper'

RSpec.describe Cart, :type => :model do

  #  before do
  #    p1 = Product.create(id: 1, name: 'AAA', qty: 1, price: 100)
  # end

  let(:cart){Cart.create!}

  let(:p1){ Product.create!(name: "AAA", qty: 1, price: 100) }
  let(:p2){ Product.create!(name: "BBB", qty: 2, price: 200) }
  let(:p3){ Product.create!(name: "CCC", qty: 3, price: 300) }

  it "should be empty cart" do
    expect(cart.cart_items).to eq([])
  end

  describe "Add products to cart" do

    it "Products not enough" do
      expect(cart.can_add_product?(p1.id, 2)).to eq(false)
    end

    it "Products enough" do
      expect(cart.can_add_product?(p1.id, 1)).to eq(true)
    end

    it "Same product in cart" do

    end

    it "add one product into cart" do
    end

    it "add two products into cart" do
    end

  end


  # def add_cartItem(p_id, qty)
  #   CartItem.create(   cart_id: self.id,
  #                   product_id: p_id,
  #                          qty: qty)
  # end

  # def can_add_product?(p_id, qty)
  #   Product.find(p_id).qty >= qty
  # end

  # def same_product_in_cart?

  # end

end
