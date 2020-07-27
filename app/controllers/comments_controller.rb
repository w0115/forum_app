class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: topic_path(:id))
    else
      redirect_back(fallback_location: topic_path(:id))
    end
  end
  
  
  
  private
    
    def comment_params
      params.require(:comment).permit(:user_id, :content, :topic_id, :flag)
    end
  

end