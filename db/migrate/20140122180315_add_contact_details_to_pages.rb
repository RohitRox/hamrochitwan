class AddContactDetailsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :contact_details, :text
  end
end
