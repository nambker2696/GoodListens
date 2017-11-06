class AlbumLikesController < ApplicationController
  before_action :set_album_like, only: [:show, :edit, :update, :destroy]

  # GET /album_likes
  # GET /album_likes.json
  def index
    @album_likes = AlbumLike.all
  end

  # GET /album_likes/1
  # GET /album_likes/1.json
  def show
  end

  # GET /album_likes/new
  def new
    @album_like = AlbumLike.new
  end

  # GET /album_likes/1/edit
  def edit
  end

  # POST /album_likes
  # POST /album_likes.json
  def create
    @album_like = AlbumLike.new(album_like_params)

    respond_to do |format|
      if @album_like.save
        format.html { redirect_to @album_like, notice: 'Album like was successfully created.' }
        format.json { render :show, status: :created, location: @album_like }
      else
        format.html { render :new }
        format.json { render json: @album_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_likes/1
  # PATCH/PUT /album_likes/1.json
  def update
    respond_to do |format|
      if @album_like.update(album_like_params)
        format.html { redirect_to @album_like, notice: 'Album like was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_like }
      else
        format.html { render :edit }
        format.json { render json: @album_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_likes/1
  # DELETE /album_likes/1.json
  def destroy
    @album_like.destroy
    respond_to do |format|
      format.html { redirect_to album_likes_url, notice: 'Album like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_like
      @album_like = AlbumLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_like_params
      params.require(:album_like).permit(:user_id, :album_id)
    end
end
