class AddMoreFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :company, :string
    add_column :contacts, :city, :string
    add_column :contacts, :state, :string
  end
end
