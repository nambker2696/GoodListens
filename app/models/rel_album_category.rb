class RelAlbumCategory < ApplicationRecord
	has_many :albums,class_name: "Album",
	primary_key: "album_id", foreign_key: "id"
	has_many :categories, class_name: "Category",
	primary_key: "category_id", foreign_key: "id"
end
