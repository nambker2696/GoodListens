class Song < ApplicationRecord
	has_many :reviews,
		class_name: 'Review', foreign_key: 'song_id',
		primary_key: 'id', dependent: :destroy

	has_one :song_singer_rels, foreign_key: "song_id",
		class_name: "SongSinger", dependent: :destroy
	has_one :singer, through: :song_singer_rels, source: :singer

	has_many :rel_categories, class_name: "RelSongCategory",
		foreign_key: "id", dependent: :destroy
	has_many :categories, through: :rel_categories,
		source: :categories

	mount_uploader :cover, CoverUploader
	mount_uploader :song_url, Mp3Uploader
end
