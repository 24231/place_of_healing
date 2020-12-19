class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :update, :destroy]
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿されました"
      redirect_to root_url
    else
      render "posts/new"
    end
  end
  
  def destroy
  end

  private
  
    def post_params
      params.require(:post).permit(:place, :content)
    end
    
end
