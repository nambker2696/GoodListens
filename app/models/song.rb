class Song < ApplicationRecord
	has_one :category, class_name: 'Category', foreign_key: 'category_id', primary_key: 'id'
	has_many :reviews,  class_name: 'Review', foreign_key: 'song_id', primary_key: 'id'

	has_one :song_singer_rels, foreign_key: "song_id", class_name: "SongSinger"
	has_one :singer, through: :song_singer_rels, source: :singer

	has_many :rel_categories, class_name: "RelSongCategory", foreign_key: "song_id"
	has_many :categories, through: :rel_categories, source: :categories
end
