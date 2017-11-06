class AlbumCommentsController < ApplicationController
  before_action :set_album_comment, only: [:show, :edit, :update, :destroy]

  # GET /album_comments
  # GET /album_comments.json
  def index
    @album_comments = AlbumComment.all
  end

  # GET /album_comments/1
  # GET /album_comments/1.json
  def show
  end

  # GET /album_comments/new
  def new
    @album_comment = AlbumComment.new
  end

  # GET /album_comments/1/edit
  def edit
  end

  # POST /album_comments
  # POST /album_comments.json
  def create
    @album_comment = AlbumComment.new(album_comment_params)

    respond_to do |format|
      if @album_comment.save
        format.html { redirect_to @album_comment, notice: 'Album comment was successfully created.' }
        format.json { render :show, status: :created, location: @album_comment }
      else
        format.html { render :new }
        format.json { render json: @album_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_comments/1
  # PATCH/PUT /album_comments/1.json
  def update
    respond_to do |format|
      if @album_comment.update(album_comment_params)
        format.html { redirect_to @album_comment, notice: 'Album comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_comment }
      else
        format.html { render :edit }
        format.json { render json: @album_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_comments/1
  # DELETE /album_comments/1.json
  def destroy
    @album_comment.destroy
    respond_to do |format|
      format.html { redirect_to album_comments_url, notice: 'Album comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_comment
      @album_comment = AlbumComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_comment_params
      params.require(:album_comment).permit(:user_id, :parent_id, :content, :album_id)
    end
end
