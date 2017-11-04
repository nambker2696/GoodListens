class Song < ApplicationRecord
	has_many :reviews,
		class_name: 'Review', foreign_key: 'song_id',
		primary_key: 'id', dependent: :destroy

	has_many :song_singer_rels, foreign_key: "song_id",
					 class_name: "SongSinger", dependent: :destroy
	has_many :singers, through: :song_singer_rels, source: :singer

	has_many :rel_categories, class_name: "RelSongCategory",
		foreign_key: "song_id", dependent: :destroy
	has_many :categories, through: :rel_categories,
		source: :categories

	belongs_to :album, class_name: "Album",foreign_key: "album_id",optional: true,dependent: :destroy
	belongs_to :author, class_name: "Author",foreign_key: "author_id",optional: true,dependent: :destroy
	belongs_to :localtion, class_name: "Localtion",foreign_key: "localtion_id",optional: true,dependent: :destroy

	mount_uploader :cover, CoverUploader
	mount_uploader :song_url, Mp3Uploader
end
