class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.boolean :home_delivery
      t.float :used_for
      t.string :condition
      t.datetime :expiry_date
      t.string :photo
      t.float :price

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
