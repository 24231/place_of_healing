class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :update, :destroy]
  before_action :correct_user,   only: :destroy
  
  def show
    @post = Post.find_by(id:params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success] = "投稿されました"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render "posts/new"
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to root_url
  end

  private
  
  def post_params
     params.require(:post).permit(:place, :content, :image)
  end
    
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
