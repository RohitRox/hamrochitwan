class AddBgDetailsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :bg_details, :string
  end
end
