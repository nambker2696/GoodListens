class AlbumsController < ApplicationController

	def index
		@albums = Album.all
		.paginate page: params[:page], per_page: 8
		@category = Category.all
	end

	def show
		@song = Song.where(album_id: params[:id])
		@album = Album.find_by id: params[:id]
	end

	def category
		@category = Category.all
		category_choose = Category.where(slug: params[:album_id])
		@albums = Album.where(category_id: category_choose.ids)
		
		# @albums = []
		# category_choose.each do |sss|
		# 	result = Album.find_by id: sss.album_id
		# 	@albums.push(result)
		# end

	end
end
