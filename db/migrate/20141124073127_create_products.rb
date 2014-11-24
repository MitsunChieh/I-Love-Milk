class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.text :desciption

      t.timestamps

    end
    add_attachment :products, :logo_url

  end
end