class AddChangeTypeDevolutionTypeToOrderChanges < ActiveRecord::Migration[6.0]
  def change
    add_column :order_changes, :change_type, :integer, default: 0
    add_column :order_changes, :devolution_type, :integer, default: 0
  end
end
