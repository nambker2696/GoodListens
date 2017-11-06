class CreateAlbumLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :album_likes do |t|
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
