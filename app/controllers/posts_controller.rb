class PostsController < ApplicationController

  def show
    @post=Post.find_by_id(params[:id])
    pp @post
  end

  def index
    if  params[:classify]
        @posts = Post.joins(:classifies).where(classifies: {id:params[:classify]}).paginate(:page => params[:page], :per_page => 5)
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

def about

end

end
