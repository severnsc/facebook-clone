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
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
