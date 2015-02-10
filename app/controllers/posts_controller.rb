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

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit(:title, :body, :tag_list)
      redirect_to root_path
    else
      render :edit
    end
  end

  def click_post
    @post = Post.find params[:id]
    @post.count += 1
    @post.save
    redirect_to @post
  end

  def tag
    @posts = Post.tagged_with(params[:name])
    render :index
  end

end
