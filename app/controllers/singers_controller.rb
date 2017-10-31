class SingersController < ApplicationController
  def index
    @singers = Singer.all.order(:name).paginate page: params[:page], per_page: 10
  end

  def show
    @singer = Singer.find_by id: params[:id]
  end
end