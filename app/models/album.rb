class Album < ApplicationRecord
	has_many :album_comments,foreign_key: 'album_id',
		primary_key: 'id',class_name: "AlbumComment", dependent: :destroy
	has_many :album_likes,foreign_key: 'album_id',
		primary_key: 'id',class_name: "AlbumLike", dependent: :destroy
	belongs_to :singer, class_name: 'Singer', foreign_key: 'singer_id', dependent: :destroy
	belongs_to :category, class_name: 'Category', foreign_key: 'category_id', dependent: :destroy
	has_many :songs, dependent: :destroy

	mount_uploader :photo, PhotoUploader

end