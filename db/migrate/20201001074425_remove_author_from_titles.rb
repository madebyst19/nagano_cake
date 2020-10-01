class RemoveAuthorFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :titles, :author, :string
    add_column :titles, :price, :integer
  end
end
