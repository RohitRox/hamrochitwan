class AddThemeToPage < ActiveRecord::Migration
  def change
    add_column :pages, :theme, :string, default: "default"
  end
end
