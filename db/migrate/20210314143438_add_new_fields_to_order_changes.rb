class AddNewFieldsToOrderChanges < ActiveRecord::Migration[6.0]
  def change
    add_column :order_changes, :status, :integer, default: 0
    add_column :order_changes, :full_address, :string
    add_column :order_changes, :email, :string
  end
end
