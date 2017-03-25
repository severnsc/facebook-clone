class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = Friendship.new
    @friend = User.find(params[:friend])
    @friendship.friend = @friend
    @friendship.user = current_user
    if @friendship.save
      @notification = Notification.new
      @notification.update_attributes(user: @friend, sender: current_user, friendship_id: @friendship.reload.id)
      @notification.save
      flash[:success] = "Friend request sent!"
      redirect_to user_path(params[:friend])
    else
      redirect_to user_path(params[:friend])
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    if params['accepted'] == 'true'
      @friendship.update_attribute(:accepted, true)
      flash[:suceess] = "You and #{@friendship.user.full_name} are now friends!"
      redirect_to user_path(@friendship.user)
    else
      @friendship.delete
      redirect_to current_user
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
