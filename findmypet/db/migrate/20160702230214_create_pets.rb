class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :claim
      t.string :filename
      t.string :description
      t.boolean :lost
      t.boolean :found
      t.belongs_to :owner, index: true

      t.timestamps null: false
    end
  end
end
