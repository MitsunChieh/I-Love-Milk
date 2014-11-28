class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :qty, null: false, default: 0

      t.timestamps
    end
  end
end
