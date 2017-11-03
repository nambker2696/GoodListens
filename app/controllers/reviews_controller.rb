class ReviewsController < ApplicationController
  before_action :find_review, except: %i(new create)
  before_action :find_song, except: %i(create show)

  attr_reader :review, :song

  def show
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, review_id: review.id)
      @comments = review.comments.all.hash_tree(limit_depth: 2)
      @comment = review.comments.build
      @bookmark = review.bookmarks.find_by user_id: current_user.id
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
  	if review.save
      song = Song.find(review_params[:song_id])
      song.update_attributes(rate_avg: 
        ((song.sum_rate * song.rate_avg + @review.rate_score)/(song.sum_rate + 1)),
          sum_rate: (song.sum_rate + 1))
      redirect_to song
      flash[:success] = t("app.review.create_success")
    else
      flash[:success] = t("app.review.create_unsuccess")
      redirect_to :back
  	end
  end

  def edit; end

  def update
    if review.update_attributes review_params
      redirect_to song
      flash[:success] = t("app.review.update_success")
    else
      flash[:success] = t("app.review.update_unsuccess")
      redirect_to :back
    end
  end

  def destroy
    if review.destroy
      flash[:success] = t("app.review.destroy_success")
    else
      flash[:danger] = t("app.review.destroy_unsuccess")
    end
    redirect_to song
  end

  private

  def review_params
    params.require(:review).permit(Review::CREATE_PARAMS)
  end

  def find_song
    @song = Song.find_by id: params[:song_id]
    render_not_found unless song
  end

  def find_review
    @review = Review.find_by id: params[:id]
    render_not_found unless review
  end
end
