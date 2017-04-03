class CommentsController < ApplicationController

  def create
    @post =Post.find_by_id(params[:post_id])
    pp @post
    @comment=Comment.new(comment_params)
    @comment.post_id=@post.id
    pp @comment
    @comment.save!
    @comment.errors.full_messages
    redirect_to post_url(@post)
  end


  comment=Comment.new(:commenter=>"123" , :body =>"qwe",:post_id=> "3")

  private
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
