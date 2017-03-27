class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new
    @post = Post.find(params[:post_id])
    @like.post = @post
    @like.user = current_user
    if @like.save
      flash[:success] = "Post liked!"
      redirect_to user_path(@post.user)
    else
      flash[:danger] = "Post not liked!"
      redrirect_to user_path(@post.user)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.delete
    redirect_to user_path(@like.post.user)
  end
end
