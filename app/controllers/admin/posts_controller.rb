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
      params[:categories].each {|category|

        category1=Category.find(category)
        @post.categories << category1

     }

=begin
    i=1
    while i<params[:categories].length
      @post.categories=params[:categories].gets(i)
      i+=1
    end
=end

=begin
    for i in params[:categories]
      pp i.is_a?(String)
      pp i.to_i
      @post.categories=i.to_i

    end
=end

   if  @post.save
     @a =  @post.id
     redirect_to  controller: "admin/posts",action: "show",id: @post.id

     # action: show ,id: @a       进入的是post？id=33界面。进入index界面
     # @post 进入post前台界面
     # action: show ,id: @post.id    次数id为空，在建立我们的数据模型的时候并没有添加id属性，所以不能直接使用
    # admin_posts_url(@post)          url位小数点格式，
    # admin_posts_path(@post)
    # controller: "admin/posts",action: "show",id: @post.id

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
