class PostsController < ApplicationController
  before_action :authenticate_user!

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
    @friend_ids = []
    current_user.accepted_friends.each {|f| @friend_ids << f.id}
    @posts = Post.where('user_id = ? OR user_id IN (?)', current_user.id, @friend_ids).order("created_at DESC")
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
