class CreateBuzzs < ActiveRecord::Migration
  def change
    create_table :buzzs do |t|
      t.string :title
      t.string :link
      t.string :picture
      t.integer :status, default: 0
      t.datetime :expiry_date
      t.integer :position, default: 0

      t.timestamps
    end
  end
end