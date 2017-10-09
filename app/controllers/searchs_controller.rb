class SearchsController < ApplicationController
	before_action :search
  def index
  	@songs
  end
  def search
  	keyword = params[:keyword]
  	if params[:category][0] == ""
  		@songs = Song.all
  	else
  		@songs = Category.find(params[:category][0]).songs
  	end
  	@songs = @songs.where('title like ?',"%" + keyword + "%")
  end
end
