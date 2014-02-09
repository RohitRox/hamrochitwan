class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.string :picture
      t.references :business

      t.timestamps
    end
    add_index :pages, :business_id
  end
end
