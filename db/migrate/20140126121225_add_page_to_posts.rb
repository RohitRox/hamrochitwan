class AddPageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page_id, :integer
    add_index :posts, :page_id
  end
end
