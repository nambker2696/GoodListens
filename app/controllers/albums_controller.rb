class AlbumsController < ApplicationController
	def index
		@albums = Album.all
		.paginate page: params[:page], per_page: 6
		@category = Category.all
	end

	def show
		@song = Song.where(album_id: params[:id])
		@album = Album.find_by id: params[:id]
		@comment = AlbumComment.where(album_id: params[:id])
		if user_signed_in?
			@like = AlbumLike.find_by(user_id: current_user.id, album_id: @album.id)
		end
	    @top_vn = Album.joins(:singer).where('singers.localtion_id' => 1).limit(10)
	    @top_en = Album.joins(:singer).where('singers.localtion_id' => 2).limit(10)
	    @top_ja = Album.joins(:singer).where('singers.localtion_id' => 3).limit(10)
	end

	def category
		@category = Category.all
		category_choose = Category.where(slug: params[:album_id])
		@albums = Album.where(category_id: category_choose.ids)
		.paginate page: params[:page], per_page: 5
		@search = category_choose
	end
end
