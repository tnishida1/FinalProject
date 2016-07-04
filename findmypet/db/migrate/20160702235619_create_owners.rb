class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first
      t.string :last
      t.integer :zipcode
      t.string :user_id

      t.timestamps null: false
    end
  end
end
