class SearchsController < ApplicationController
	before_action :search

  def index
  	@songs.paginate page: params[:page], per_page: 10
  end

	def search
  	keyword = params[:keyword]
  	if params[:category][0] == ""
  		@songs = Song.all
  	else
  		@songs = Category.find(params[:category][0]).songs
  	end
		@songs = @songs.where('title like ?',"%" + keyword + "%")
			.paginate(page: params[:page], per_page: 10)
  end
end
