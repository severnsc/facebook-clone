class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
      flash[:danger] = "Invalid post!"
      redirect_to current_user
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post edited!"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:sucess] = "Post deleted!"
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
