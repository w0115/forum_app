class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にトピック一覧のページに飛ぶ
      session[:user_id] = user.id
      redirect_to topics_path
    else
      flash.now[:danger] = 'メールアドレスもしくはパスワードが違います'
      render 'new' #ログイン画面に戻る
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end