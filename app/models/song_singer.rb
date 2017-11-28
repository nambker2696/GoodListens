class SongSinger < ApplicationRecord
	has_many :song, class_name: 'Song', foreign_key: 'id', primary_key: 'song_id'
	has_many :singer, class_name: 'Singer', foreign_key: 'id', primary_key: 'singer_id'
end
