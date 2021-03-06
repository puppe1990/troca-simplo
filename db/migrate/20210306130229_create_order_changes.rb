class CreateOrderChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :order_changes do |t|
      t.string :description
      t.text :clothes, array: true, default: []
      t.string :client_name
      t.string :phone
      t.string :order_id

      t.timestamps
    end
  end
end
