class BlacklistsController < ApplicationController
  
  def new
    @blacklist = Blacklist.new
  end
  
  def create
    @blacklist = Blacklist.new(blacklist_params)
  binding.pry
    if @blacklist.user_id = User.find(@blacklist.user_id)
      @blacklist.save
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
