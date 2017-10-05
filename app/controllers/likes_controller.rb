class LikesController < ApplicationController
  attr_reader :like

  def create
    @like = Like.new
    @review = Review.find_by id: params[:review_id]
    like.review_id = params[:review_id]
    like.user_id = current_user.id
    if like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @like = Like.find_by id: params[:id]
    @review = Review.find_by id: params[:review_id]
    if like.destroy
      respond_to do |format|
        format.js
      end         
    end
  end
end
