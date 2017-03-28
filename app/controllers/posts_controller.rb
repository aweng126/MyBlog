class PostsController < ApplicationController

  def show
    if params[:category]
      @posts = Post.joins(:categories).where(categories: {id:params[:category]})
    else
      @posts=Post.all
    end
  end

  def new

  end

  def create
    @post=Post.new(post_params)
    @post.save

    # redirect_to @post
    redirect_to :action => "show", :id => @post.__id__
  end

  private
  def post_params
    # params.store("published_at",Time.now)
    params.require(:post).permit(:title,:author,:content)
    # pp params
  end
end
