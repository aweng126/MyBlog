class PostsController < ApplicationController

  def show
    if params[:category]
      @posts = Post.joins(:categories).where(categories: {id:params[:category]})
    else
      @posts=Post.all
    end
  end
end
