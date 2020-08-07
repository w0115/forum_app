class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate_user 
    if session[:user_id] == nil
      redirect_to ("/login")
    end
  end

  def confirm_authenticity_user
    user = User.find_by(id: current_user.id)
    if user.flag == false
      redirect_to ("/blacklists/:id/edit")
    end
  end
  
end
