class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
