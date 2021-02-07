class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @feed_items = Post.all.order(created_at: :desc).paginate(page: params[:page]) 
    end
  end
end
