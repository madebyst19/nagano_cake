class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name , null: false, default: 0
      t.string :image_id , null: false, default: 0
      t.text :introduction , null: false, default: 0
      t.integer :price , null: false, default: 0
      t.boolean :is_active , null: false, default: false, default: 0
      t.timestamps
    end
  end
end
