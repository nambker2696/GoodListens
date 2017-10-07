class StaticPagesController < ApplicationController
  def home
  	@most_popular_reviews = Review.sort_by_comment
  	if signed_in?
	  	@following_reviews = []
	  	current_user.following.each do |user|
	  		user.reviews.each do |r|
		  		@following_reviews.push(r)
		  	end
	  	end
	  	if !@following_reviews.nil?
			@following_reviews.sort_by{|r| r.created_at}
		end
	end
  end
end
