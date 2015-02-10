class PostsController < ApplicationController


  def index
    if params[:search_text].present?
      @posts = Post.search(params[:search_text]).order("count DESC")
    else
      @posts = Post.all.order("count DESC")
    end
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
