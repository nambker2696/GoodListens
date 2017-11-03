class SingersController < ApplicationController
  def index
    @singers = Singer.all.order(:name).paginate page: params[:page], per_page: 10
    @top_ten_vn = Singer.where(localtion_id: 1).limit(10)
    @top_ten_en = Singer.where(localtion_id: 2).limit(10)
    @top_ten_ja = Singer.where(localtion_id: 3).limit(10)
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
