class Admin::PostsController < ApplicationController

  def index
    if params[:category]
      @posts = Post.joins(:categories).where(categories: {id:params[:category]}).paginate(:page => params[:page], :per_page => 5)
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
      puts 'all'
      puts params.inspect
    end
  end


  def show
    @post=Post.find_by_id(params[:id])
    pp @post
  end

  def new
  end

  def create
    @post=Post.new(post_params)
    # pp @post
    @post.save
    redirect_to post_url(@post)
    # action: show ,id: @post.id
    # admin_post_url(@post)
    # admin_post_url(@post)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
     @post = Post.find_by_id(params[:id])

     # params[:post] .each do|key,value|
     #   puts key,':',value,'######'
     # end

     @post.author=params[:post]["author"]
     @post.content=params[:post]["content"]
     @post.title=params[:post]["title"]

    if @post.save
      redirect_to  @post
    else
      render 'edit'
    end
  end


  def about
  end

  def destroy

    @post=Post.find_by_id(params[:id])
    @post.destroy

    render 'index'

  end

  private
  def post_params
    params.require(:post).permit(:title,:author,:content)
    # pp params
  end

end
