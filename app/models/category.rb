class Category < ApplicationRecord
	has_many :rel_songs, class_name: "RelSongCategory", foreign_key: "category_id"
	has_many :songs, through: :rel_songs, source: :songs

	def self.get_popular_categories
		Category.all.sort_by{|c| getReviewCount(c)}
	end
	def self.getReviewCount category
		sum = 0
		category.songs.each do |s|
			sum += s.reviews.count
		end
		sum
	end
end
