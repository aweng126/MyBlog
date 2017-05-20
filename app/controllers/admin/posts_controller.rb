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
      @posts=Post.all .paginate(:page => params[:page], :per_page => 10)
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

    # 更新本篇文章的分类

    params[:classifies].each {|classify|

      classify1=Classify.find(classify)
      @post.classifies << classify1

     }


   if  @post.save
     @a =  @post.id
     redirect_to  controller: "admin/posts",action: "show",id: @post.id

   end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    pp params[:id]

     @post = Post.find_by_id(params[:id])

     # params[:post] .each do|key,value|
     #   puts key,':',value,'######'
     # end

     @post.author=params[:post]["author"]
     @post.content=params[:post]["content"]
     @post.title=params[:post]["title"]

    
     @post.categories.clear

=begin
     # 更新本篇文章的分类
    params[:categories].each {|category|
      category1=Category.find(category)
      @post.categories << category1
    }
=end

     # 更新本篇文章的分类
    params[:classifies].each {|classfy|
      classfy1=Classify.find(classfy)
      @post.classifies << classfy1
    }


    if @post.save
      redirect_to   controller: "admin/posts",action: "show",id: @post.id
    else
      render 'edit'
    end
  end


  def about
  end

  def destroy
    pp params[:id]
    pp "post  destroy"
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
