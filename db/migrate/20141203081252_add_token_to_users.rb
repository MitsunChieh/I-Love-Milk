class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :token_expired, :datetime

    add_index :users, :token, :unique => true
  end
end
