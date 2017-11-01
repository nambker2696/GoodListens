class CreateRelSongCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :rel_song_categories do |t|
      t.integer :song_id
      t.integer :category_id

      t.timestamps
    end
  end
end
