class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #ログインしようとしているユーザーがブラックリストに入っているか確認する
    
    
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にトピック一覧のページに飛ぶ
      if user.flag == false
        redirect_to ('https://www.google.com')
      else
        log_in(user)
        redirect_to topics_path
      end
    else
      flash.now[:danger] = 'メールアドレスもしくはパスワードが違います'
      render 'new' #ログイン画面に戻る
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url and return
  end
  
end