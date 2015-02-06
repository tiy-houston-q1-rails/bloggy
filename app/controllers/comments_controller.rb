class CommentsController < ApplicationController
  def create


    @post = Post.find(params[:id])

    @comment = Comment.new params.require(:comment).permit(:message)
    @comment.post = @post
    if @comment.save
      redirect_to @post, notice: "Comment Posted"
    else
      redirect_to @post, alert: "Your shitty comment was not saved"
    end

  end
end
