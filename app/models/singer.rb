class Singer < ApplicationRecord
  has_many :song_singer_rels, foreign_key: "singer_id",
           class_name: "SongSinger", dependent: :destroy
  has_many :songs, through: :song_singer_rels, source: :song
  has_many :albums, dependent: :destroy

  belongs_to :localtion, class_name: "Localtion",foreign_key: "localtion_id",optional: true,dependent: :destroy


  mount_uploader :avatar, AvatarUploader
  enum gender: %i(Female Male).freeze
end
