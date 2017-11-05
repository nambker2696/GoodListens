class Review < ApplicationRecord
	belongs_to :user
	belongs_to :song

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy, as: :target
	has_many :bookmarks, dependent: :destroy

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
