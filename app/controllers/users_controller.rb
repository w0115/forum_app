class UsersController < ApplicationController
  
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
    @user = User.find_by(id: user_id)
    @topic = Topic.where(user_id: @user)
    @comment = Comment.where(user_id: @user)
  end
  
  private
    
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
