class SongsController < ApplicationController
  attr_reader :song, :review

  def index
    @songs = Song.all.order(rate_avg: :desc)
      .paginate page: params[:page], per_page: 10
    @top_ten_vn = Song.where(localtion_id: 1).order(rate_avg: :desc).limit(10)
    @top_ten_en = Song.where(localtion_id: 2).order(rate_avg: :desc).limit(10)
    @top_ten_ja = Song.where(localtion_id: 3).order(rate_avg: :desc).limit(10)

  end

  def show
    @song = Song.find_by id: params[:id]
    if user_signed_in?
      @review = Review.find_by song_id: @song.id,
        user_id: current_user.id
    end
    @reviews = song.reviews.order(created_at: :desc).to_a
    index_of_review = @reviews.index @review
    if index_of_review && index_of_review != 0
      @reviews.delete_at index_of_review
      @reviews.unshift @review
    end
  end
end
