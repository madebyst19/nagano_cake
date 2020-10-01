class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :price , null: false, default: 0
      t.integer :amount , null: false, default: 0
      t.integer :making_status , null: false, default: 0
      t.timestamps
    end
  end
end