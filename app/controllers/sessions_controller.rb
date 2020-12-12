class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to  "/users/#{session[:user_id]}/show"
    else
      flash.now[:danger] ='名前またはパスワードが正しくありません'
      render '/sessions/new'
    end
  end
  
  def destroy
  end
  
end
