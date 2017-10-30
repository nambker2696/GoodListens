class CreateRelAlbumCategories < ActiveRecord::Migration[5.1]
	def change
		create_table :rel_album_categories do |t|
			t.integer :album_id
			t.integer :category_id
			t.timestamps
		end
	end
end
