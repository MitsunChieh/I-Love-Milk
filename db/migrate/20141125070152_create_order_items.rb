class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :qty, null: false, default: 0
      t.integer :price

      t.timestamps
    end
  end
end
