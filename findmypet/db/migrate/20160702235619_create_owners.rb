class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first
      t.string :last
      t.integer :zipcode
      t.references :user

      t.timestamps null: false
    end
  end
end
