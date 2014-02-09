class AddThemeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :background, :boolean
    add_column :pages, :background_image, :string
  end
end
