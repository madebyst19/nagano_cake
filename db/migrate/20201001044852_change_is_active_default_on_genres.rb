class ChangeIsActiveDefaultOnGenres < ActiveRecord::Migration[5.2]
  def change
    change_column_default :genres, :is_active, from: 0, to: true
  end
end
