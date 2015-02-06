class PostsController < ApplicationController


  def index
    @posts = Post.order("count DESC")
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def click_post
    @post = Post.find params[:id]
    @post.count += 1
    @post.save
    redirect_to @post
  end

end
