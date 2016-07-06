class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :owner_id
      t.boolean :lost
      t.boolean :found
      t.references :owner, index: true

      t.timestamps null: false
    end
  end
end
