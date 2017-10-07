class BookmarksController < ApplicationController
  attr_reader :bookmark

  def create
    @bookmark = Bookmark.new
    bookmark.user_id = current_user.id
    bookmark.review_id = params[:review_id]
    if bookmark.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find_by id: params[:id]
    @review = Review.find_by id: params[:review_id]
    if bookmark.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
