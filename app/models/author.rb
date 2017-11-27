class Author < ApplicationRecord
	has_many :songs, dependent: :destroy
	# mount_uploader :avatar, AvatarUploader
	enum gender: %i(Female Male).freeze
end
