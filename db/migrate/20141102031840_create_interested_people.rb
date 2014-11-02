class CreateInterestedPeople < ActiveRecord::Migration
  def change
    create_table :interested_people do |t|
        t.string :name, null: false, default: ""
        t.string :gender, null: false, default: ""
        t.string :email, null: false, default: ""
      t.timestamps
    end
  end
end
