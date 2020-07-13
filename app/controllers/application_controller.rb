class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate_user 
    if session[:user_id] == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
end
