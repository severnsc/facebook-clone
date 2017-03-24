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
    @user = User.find(params[:id])
    current_user.friendships.find_by_friend_id(@user.id).delete
    flash[:success] = "Friendship removed"
    redirect_to current_user
  end

  private

  def friendship_params
    params.permit(:friend)
  end
end
