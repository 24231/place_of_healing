class UsersController < ApplicationController
  
  def show
    @user =  User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to "/users/#{@user.id}/show"
    else
      render "/users/new"
    end
  end
  
  def edit
  end
  
  def update
  end

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

