class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :description
      t.string :author_name
      t.integer :sum_rate
      t.float :rate_avg
      t.string :cover, default: "/assets/images/fallback/default_song.jpg"
      t.string :song_url, default: ""
      t.timestamps
    end
  end
end
