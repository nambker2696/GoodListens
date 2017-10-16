class CommentsController < ApplicationController
  attr_reader :comment, :parent
 
  def create
    @comment = Comment.new comment_params
    @review = @comment.review
    if params[:comment][:parent_id].to_i > 0
      @parent = Comment.find_by_id params[:comment].delete(:parent_id)
      @still_leaf = parent.leaf?
      @comment = parent.children.build comment_params
    end
    if comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    @is_leaf = comment.leaf?
    comment.children.each do |child|
      child.destroy
    end
    if comment.destroy
      respond_to do |format|
        format.js
      end         
    end
  end

  def update
    @comment = Comment.find_by id: params[:id]
    if  params[:comment][:content] != ''
      @comment.update_attributes(content: params[:comment][:content])
      respond_to do |format|
        format.js
      end
    else
    end
  end

  private
    
  def comment_params
    params.require(:comment).permit(Comment::CREATE_PARAMS)
  end
end
