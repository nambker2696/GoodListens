class Category < ApplicationRecord
	has_many :rel_songs, class_name: "RelSongCategory", foreign_key: "category_id"
	has_many :songs, through: :rel_songs, source: :songs

	def self.get_popular_categories
		Category.all.sort_by{|c| c.getReviewCount}
	end
	def getCommentCount
		sum = 0
		self.songs.each do |s|
			sum += s.reviews.count
		end
		sum
	end
end
