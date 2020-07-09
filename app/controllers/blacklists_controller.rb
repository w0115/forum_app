class BlacklistsController < ApplicationController
  
  def new
    @blacklist = Blacklist.new
  end
  
  def create
    @blacklist = Blacklist.new(blacklist_params)
    @user = User.select("id").where(id: @blacklist.user_id)
    if @blacklist.user_id ==  @user[0].id
      @blacklist.save
      @comment = Comment.where(user_id: @blacklist.user_id).update_all(:flag => false)
      
      #コメントを非表示になるようにしたりログインできないようにする
      flash[:notice] = "ブラックリストに登録しました"
      redirect_to topics_path
    else
      flash[:danger] = "ブラックリストに登録できませんでした"
      redirect_back(fallback_location: new_blacklist_path)
    end
  end
  
  private
    
    def blacklist_params
      params.require(:blacklist).permit(:user_id)
    end
end
