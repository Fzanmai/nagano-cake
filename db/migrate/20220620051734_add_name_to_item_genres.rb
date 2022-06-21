class AddNameToItemGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :item_genres, :name, :string
  end
end
