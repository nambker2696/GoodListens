class AlbumLikesController < ApplicationController
  attr_reader :like

  def create
    @like = AlbumLike.new
    @album = Album.find_by id: params[:album_id]
    like.album_id = params[:album_id]
    like.user_id = current_user.id
    if like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @like = AlbumLike.find_by(id: params[:id])
    @album = Album.find_by id: params[:album_id]
    if like.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
