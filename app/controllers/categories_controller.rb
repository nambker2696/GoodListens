class CategoriesController < ApplicationController
	before_action :get_category, only: [:show]
	def index
		@categories = Category.all
		@popular_categories = Category.get_popular_categories().last(3)
	end

	def show
		@songs = @category.songs
	end

	def get_category
		@category = Category.find(params[:id])
	end
end
