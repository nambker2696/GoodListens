class Review < ApplicationRecord
	belongs_to :user
	belongs_to :song

	has_many :comments
	has_many :likes
	has_many :bookmarks

	CREATE_PARAMS = %i(
		title
		content
		song_id
		user_id
		rate_score
	).freeze

	def self.sort_by_comment
		topValue = Review.all.count
		Review.all.sort_by{ |r| r.comments.count}.last((topValue*0.3).to_i)

	end

end
