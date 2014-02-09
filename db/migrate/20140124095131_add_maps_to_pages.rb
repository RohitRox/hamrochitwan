class AddMapsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :map_info, :point
    add_column :pages, :map_address, :string
  end
end
