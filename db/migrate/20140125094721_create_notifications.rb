class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.text :content
      t.boolean :active, default: true
      t.references :user

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
