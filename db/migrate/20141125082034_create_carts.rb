class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :amount, null: false, default: 0
      t.integer :qty, null: false, default: 0

      t.timestamps
    end
  end
end
