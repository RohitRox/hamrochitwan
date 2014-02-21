class ChangeUsedForInPosts < ActiveRecord::Migration
  def up
   change_column :posts, :used_for, :string
  end

  def down
   change_column :posts, :used_for, :float
  end
end
