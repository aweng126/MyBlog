class PostsController < ApplicationController

  def index
    @post=Post.all
  end


  def show
    if params[:category]
       @posts = Post.joins(:categories).where(categories: {id:params[:category]})
      puts 'category'
    elsif  params[:id]
       @posts = Post.joins(:categories).where(posts: {id:params[:id]})
      puts 'id'
    else
      @posts=Post.all
      puts 'all'
      puts params.inspect
    end
  end

  def new

  end

  def create
    @post=Post.new(post_params)
    @post.save
    redirect_to @post
    # redirect_to :action => "show", :id => @post.__id__
  end

  def edit
    @post = Post.find(params[:id])
  end



  def update
     @post = Post.find(params[:id])

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


  def destroy

    @post=Post.find(params[:id])
    @post.destroy

    render 'index'

  end

  private
  def post_params
    # params.store("published_at",Time.now)
    params.require(:post).permit(:title,:author,:content)
    # pp params
  end

end
