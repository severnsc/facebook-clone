require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  
  def setup
    @notification = Notification.new(user: create(:user), sender: create(:user), friendship: create(:friendship))
  end

  test "should be valid" do
    assert @notification.valid?
  end

  test "should have user" do
    @notification.user = nil
    assert_not @notification.valid?
  end

  test "should have sender" do
    @notification.sender = nil
    assert_not @notification.valid?
  end

  test "should have friendship" do
    @notification.friendship = nil
    assert_not @notification.valid?
  end
end
