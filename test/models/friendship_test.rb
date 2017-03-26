require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  
  def setup
    @friendship = Friendship.new(user: create(:user), friend: create(:user))
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should have user" do
    @friendship.user = nil
    assert_not @friendship.valid?
  end

  test "should have friend" do
    @friendship.friend = nil
    assert_not @friendship.valid?
  end
end
