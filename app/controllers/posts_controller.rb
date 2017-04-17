class PostsController < ApplicationController
  def index
    if params[:category]
      @posts = Post.joins(:categories).where(categories: {id:params[:category]})
      puts 'category'
    elsif  params[:post_id]
=begin
      由于默认在前台展示的时候是通过each循环来进行遍历的，所以这里的返回值应该是一个数组
=end
      # @posts = Post.joins(:categories).where(posts: {id:params[:id]})
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
