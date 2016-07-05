class CreateOwnerUsers < ActiveRecord::Migration
  def change
    create_table :owner_users do |t|
      t.references :owner, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
