class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user_id: current_user.id,
                           content: params[:comment][:content],
                           topic_id: params[:comment][:topic_id])
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_back(fallback_location: topic_path(:id))
    else
      redirect_back(fallback_location: topic_path(:id))
    end
  end
  
end