class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code , null: false, default: 0
      t.string :address , null: false, default: 0
      t.string :name , null: false, default: 0
      t.integer :shipping_cost , null: false, default: 0
      t.integer :total_payment , null: false, default: 0
      t.integer :payment_method , null: false, default: 0
      t.integer :status , null: false, default: 0
      t.timestamps
    end
  end
end
