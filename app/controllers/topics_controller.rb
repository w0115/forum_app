class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @topic = Topic.find(params[:id])
    @user = @topic.user_id
    @comments = Comment.where(topic_id: @topic.id)
    @comment = Comment.new
    
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    if @topic.save
      flash[:notice] = "トピックを作成しました。"
      redirect_to topics_path
    else
      redirect_back(fallback_location: new_topic_path)
    end
  end
  
  private
    
    def topic_params
      params.require(:topic).permit(:user_id, :title)
    end
    
end