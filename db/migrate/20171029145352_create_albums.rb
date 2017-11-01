class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.string :singer_id
      t.string :category_id
      t.integer :sum_rate
      t.float :rate_avg
      t.string :photo, default: "/assets/images/fallback/default_song.jpg"

      t.timestamps
    end
  end
end
