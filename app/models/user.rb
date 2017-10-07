class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :comments
  has_many :likes
  has_many :bookmarks
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships,
    source: :followed
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_relationships,
    source: :follower

  enum gender: %i(female male).freeze

  mount_uploader :avatar, AvatarUploader

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def is_owner_of? review
    self.id == review.user_id
  end

  def bookmark_of_this review
    review.bookmarks.find_by user_id: self.id
  end
end
