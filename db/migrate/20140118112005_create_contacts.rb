class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.text :message
      t.string :message_type

      t.timestamps
    end
  end
end
