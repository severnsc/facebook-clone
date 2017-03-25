class AddFriendshipToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :friendship, index: true
  end
end
