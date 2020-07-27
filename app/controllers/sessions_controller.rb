class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      #ログインしようとしているユーザーがブラックリストに入っているか確認する
      if user.flag == false
        redirect_to ('https://www.google.com')
      else
        # ユーザーログイン後にトピック一覧のページに飛ぶ
        log_in(user)
        redirect_to topics_path
      end
    else
      render 'new' #ログイン画面に戻る
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url and return
  end
  
end