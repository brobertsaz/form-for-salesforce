class AddFieldsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :sent_to_sales_force, :boolean, :default => false
  end
end
