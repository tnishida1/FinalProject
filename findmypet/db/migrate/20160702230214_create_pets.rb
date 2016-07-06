class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :claim
      t.string :filename
      t.string :description
      t.integer :owner_id
      t.references :owner, index: true

      t.timestamps null: false
    end
  end
end
