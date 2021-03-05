class CreateOrderChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :order_changes do |t|
      t.string :description
      t.text :clothes, array: true, default: []

      t.timestamps
    end
  end
end
