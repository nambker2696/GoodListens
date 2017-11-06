class CreateAlbumComments < ActiveRecord::Migration[5.1]
  def change
    create_table :album_comments do |t|
      t.integer :user_id
      t.integer :parent_id
      t.string :content
      t.integer :album_id

      t.timestamps
    end
  end
end
