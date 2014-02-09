class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :title
      t.integer :parent_id

      t.timestamps
    end
  end
end
