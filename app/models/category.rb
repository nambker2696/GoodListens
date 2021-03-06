class Category < ApplicationRecord
	has_many :rel_songs, class_name: "RelSongCategory",
		foreign_key: "category_id", primary_key: "id"
	# quan he 1-n voi bang albums
	has_many :songs, through: :rel_songs, source: :songs
  	has_many :albums

	def self.get_popular_categories
		Category.all.sort_by{|c| c.getReviewCount}
	end
	def getReviewCount
		sum = 0
		self.songs.each do |s|
			sum += s.reviews.count
		end
		sum
	end
	def get_newest_reviews
		reviews = []
		self.songs.each do |s|
			s.reviews.each do |r|
				reviews.push(r)
			end
		end
		reviews.sort_by{|r| r.updated_at}
		reviews.last(8)
	end
end
