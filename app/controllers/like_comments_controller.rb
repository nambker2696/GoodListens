class LikeCommentsController < ApplicationController
  attr_reader :like_comment

  def create
    @like_comment = Like.new
    @comment = Comment.find_by id: params[:comment_id]
    @review = Review.find_by id: params[:review_id]
    like_comment.target = @comment
    like_comment.user_id = current_user.id
    if like_comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @like_comment = Like.find_by id: params[:id]
    @comment = Comment.find_by id: params[:comment_id]
    @review = Review.find_by id: params[:review_id]

    if like_comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end