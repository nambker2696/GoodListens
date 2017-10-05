class ReviewsController < ApplicationController
  before_action :find_review, only: %i(show)

  attr_reader :review

  def index
  end

  def show
    @like = Like.find_by(user_id: current_user.id, review_id: @review.id)
    @comments = @review.comments.all
    @comment = @review.comments.build
  end

  def create
    @review = Review.new(title: review_params[:title],
      content: review_params[:content],song_id: review_params[:song_id],
      user_id: review_params[:user_id],rate_score: review_params[:rate])
  	if @review.save
      song = Song.find(review_params[:song_id])
      song.update_attributes(rate_avg: 
        ((song.sum_rate * song.rate_avg + @review.rate_score)/(song.sum_rate + 1)),
        sum_rate:  (song.sum_rate + 1))
  		redirect_to song
  	else
  		redirect_to root_path
  	end
  end

  private

  def review_params
  	params.require(:review).permit(:title, :content,:song_id,:user_id,:rate)
  end

  def find_review
    @review = Review.find_by id: params[:id]
    render_not_found unless @review
  end
end
