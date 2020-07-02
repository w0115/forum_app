class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にトピック一覧のページにリダイレクトする
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスもしくはパスワードが違います'
      render 'new' #ログイン画面に戻る
    end
  end

  def destroy
  end
end