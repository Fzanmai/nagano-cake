class AddGenreIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :item_genre_id, :integer
  end
end
