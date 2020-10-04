class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name , null: false, default: ""
      t.string :image_id , null: false, default: ""
      t.text :introduction , null: false, default: ""
      t.integer :price , null: false, default: 0
      t.integer :genre_id ,null:false
      t.boolean :is_active , null: false, default: true, comment: "ステータス"
      t.timestamps
    end
  end
end
