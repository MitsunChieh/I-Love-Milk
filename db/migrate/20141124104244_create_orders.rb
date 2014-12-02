class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :amount, null: false, default: 0
      t.string :address

      t.timestamps
    end
  end
end
