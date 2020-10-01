class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name , null: false, default: 0
      t.string :postal_code , null: false, default: 0
      t.string :address , null: false, default: 0
      t.timestamps
    end
  end
end