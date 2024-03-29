class UsersController < ApplicationController
  before_action :admin_user, only: [:show]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "新規登録が完了しました。"
      redirect_to topics_path
    else
      flash.now[:danger] = "新規登録に失敗しました。"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @topic = Topic.where(user_id: @user.id)
  end
  
  private
    
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end

    def admin_user
      redirect_to topics_path unless current_user.admin?
    end

end
