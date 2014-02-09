class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :avatar, :string
  end
end
