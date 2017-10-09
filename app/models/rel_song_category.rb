class RelSongCategory < ApplicationRecord
	has_many :songs,class_name: "Song",
		primary_key: "song_id", foreign_key: "id"
	has_many :categories, class_name: "Category",
		primary_key: "category_id", foreign_key: "id"
end
