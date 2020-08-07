class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
        log_in(user)
        #ログインしようとしているユーザーがブラックリストに入っているか確認する
        if user.flag == false
          redirect_to ("/blacklists/:id")
        else
          flash[:success] = "ログインしました。"
          redirect_to topics_path
        end
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'new' #ログイン画面に戻る
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
  
end