class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :claimed
      t.references :owner, index: true

      t.timestamps null: false
    end
  end
end
