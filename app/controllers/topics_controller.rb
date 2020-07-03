class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @topic = Topic.find(params[:id])
    @user = @topic.user_id
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to Topic
  end
  
  private
    
    def topic_params
      params.require(:topic).permit(:user_id, :title)
    end
    
end
