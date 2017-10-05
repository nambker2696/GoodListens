class CommentsController < ApplicationController
    attr_reader :comment
    
    def create
        @comment = Comment.new
        comment.user_id = current_user.id 
        comment.content = comment_params[:content]
        comment.review_id = params[:review_id]
        if comment.save
            respond_to do |format|
                format.js
            end
        end
    end

    def destroy
    end

    private
    
    def comment_params
        params.require(:comment).permit(:content)
    end
end
