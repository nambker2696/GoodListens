class Review < ApplicationRecord
	belongs_to :user
	belongs_to :song
	has_many :comments

	CREATE_PARAMS = %i(
		title
		content
		song_id
		user_id
		rate_score
	).freeze
end
