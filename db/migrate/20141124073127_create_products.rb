class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.integer :qty
      t.integer :price

      t.timestamps

    end
    add_attachment :products, :logo_url

  end
end