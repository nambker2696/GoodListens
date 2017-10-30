class AddAlbumIdToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :album_id, :integer
  end
end
