class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = Friendship.new
    @friend = User.find(params[:friend])
    @friendship.friend = @friend
    @friendship.user = current_user
    if @friendship.save
      flash[:success] = "Friend request sent!"
      redirect_to user_path(params[:friend])
    else
      redirect_to user_path(params[:friend])
    end
  end

  def destroy
  end

  private

  def friendship_params
    params.permit(:friend)
  end
end
