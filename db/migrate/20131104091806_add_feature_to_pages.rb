class AddFeatureToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :feature, :boolean, default: false
  end
end
