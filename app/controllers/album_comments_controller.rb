class AlbumCommentsController < ApplicationController
  attr_reader :albumcomment
  def create
    @comment = AlbumComment.new album_comment_params
    if @comment.save
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def update
    
  end

  def destroy
   
  end

  private
  def album_comment_params
    params.require(:album_comment).permit(:user_id, :parent_id, :content, :album_id)
  end
end
