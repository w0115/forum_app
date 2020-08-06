class BlacklistsController < ApplicationController
  before_action :authenticate_user
  before_action :admin_user, only: [:new]
  
  def new
    @blacklist = Blacklist.new
    @users = User.all
  end
  
  def create
    @blacklist = Blacklist.create(blacklist_params)
    @user = User.select("id").where(id: @blacklist.user_id)
    if @user[0].blank?
      redirect_back(fallback_location: new_blacklist_path)
      flash[:danger] = "ブラックリスト登録に失敗しました。"
    elsif  @blacklist.user_id ==  @user[0].id
      @blacklist.save
      #コメントを非表示になるようにしたりログインできないようにする
      Comment.where(user_id: @blacklist.user_id).update_all(:flag => false)
      Topic.where(user_id: @blacklist.user_id).update_all(:flag => false)
      User.where(id: @blacklist.user_id).update_all(:flag => false)
      flash[:success] = "ブラックリスト登録が完了しました。"
      redirect_to topics_path
    else
      flash[:danger] = "ブラックリスト登録が失敗しました。"
      redirect_back(fallback_location: new_blacklist_path)
    end
  end
  
  private
    
    def blacklist_params
      params.require(:blacklist).permit(:user_id)
    end
    
    def admin_user
      redirect_to topics_path unless current_user.admin?
    end
    
end
