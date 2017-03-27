class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to user_path(@post.user)
    else
      flash[:danger] = "Invalid comment!"
      redirect_to user_path(@post.user)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment edited!"
      redirect_to user_path(@comment.post.user)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    flash[:success] = "Comment deleted!"
    redirect_to user_path(@comment.post.user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
