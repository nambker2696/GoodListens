class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :description
      t.integer :author_id
      t.integer :sum_rate
      t.float :rate_avg
      t.string :cover, default: "/assets/images/fallback/default_song.jpg"
      t.string :song_url, default: ""
      t.integer :album_id
      t.timestamps
    end
  end
end
