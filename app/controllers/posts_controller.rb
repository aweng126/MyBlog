class PostsController < ApplicationController
  def index
    if params[:category]
      @posts = Post.joins(:categories).where(categories: {id:params[:category]}).paginate(:page => params[:page], :per_page => 5)
      puts 'category'
    elsif  params[:post_id]
      @posts=[]
      @posts << Post.find(params[:post_id])
      puts 'id'
    else
      @posts=Post.all.paginate(:page => params[:page], :per_page => 5)
      # Post.paginate(:page => params[:page], :per_page => 30)
      puts 'all'
      puts params.inspect
    end
  end

  def show
    @post=Post.find_by_id(params[:id])
    pp @post
  end

end
