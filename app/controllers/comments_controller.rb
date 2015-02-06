class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])

    @comment = Comment.new params.require(:comment).permit(:message)
    @comment.post = @post
    @comment.save
    redirect_to @post # I need the post somehow

  end
end
