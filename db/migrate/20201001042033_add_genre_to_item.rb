class AddGenreToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_id, :integer, null: false, default:0
  end
end
