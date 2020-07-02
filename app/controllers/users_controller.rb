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
      #本来はトピック一覧に飛ぶようにする
      log_in @user
      redirect_to user
    else
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  
  private
    
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
