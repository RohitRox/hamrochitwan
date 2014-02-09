class AddHotdealToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hotdeal, :boolean, default: false
    add_column :posts, :hotdeal_expiry, :datetime
    add_column :posts, :hotdeal_status, :integer, default: 0
  end
end
