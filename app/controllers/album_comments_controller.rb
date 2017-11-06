class AlbumCommentsController < ApplicationController
  attr_reader :comment, :parent
  def create

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
