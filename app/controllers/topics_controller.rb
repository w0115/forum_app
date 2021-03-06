class TopicsController < ApplicationController
  before_action :authenticate_user
  before_action :confirm_authenticity_user
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @topic = Topic.find_by(id: params[:id])
    @user_id = @topic.user_id
    @comments = Comment.where(topic_id: @topic.id)
    @comment = Comment.new
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:success] = "スレッドを作成しました。"
      redirect_to topics_path
    else
      flash[:danger] = "スレッド作成に失敗しました。"
      redirect_back(fallback_location:new_topic_path)
    end
  end
  
  private
    
    def topic_params
      params.require(:topic).permit(:user_id, :title)
    end
    

end