class Singer < ApplicationRecord
  has_many :song_singer_rels, foreign_key: "singer_id",
           class_name: "SongSinger", dependent: :destroy
  has_many :songs, through: :song_singer_rels, source: :song
  has_many :albums, foreign_key: "singer_id",
           class_name: "Album"

  mount_uploader :avatar, AvatarUploader
  enum gender: %i(Female Male).freeze
end
