class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment = Comment.new
    @user = @topic.user_id
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path
  end
  
  private
    
    def topic_params
      params.require(:topic).permit(:user_id, :title)
    end
    
end

#<div class="row">
#  <div class="col-md-6 col-md-offset-3">
#    <%= form_for (@comment) do |f| %>
#      <%= f.text_field :content %>
#      
#      <%= f.submit 'コメントする' %>
#    <% end %>
#  </div>
#</div>
