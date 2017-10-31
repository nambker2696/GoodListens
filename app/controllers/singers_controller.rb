class SingersController < ApplicationController
  def index
    @singers = Singer.all.order(:name).paginate page: params[:page], per_page: 10
  end

  def show
    @singer = Singer.find_by id: params[:id]
  end

  def search
    keyword = params[:keyword]
    @singers = Singer.all
    @singers = @singers.where('name like ?',"%" + keyword + "%")
               .paginate(page: params[:page], per_page: 10)
    render 'index'
  end
end
