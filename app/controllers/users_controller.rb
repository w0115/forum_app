class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      #トピック一覧に飛ぶ
      redirect_to ("/topics")
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  
  private
    
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
