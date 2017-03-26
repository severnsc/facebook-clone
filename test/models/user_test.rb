require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(email: "user@example.com", first_name: "Test", last_name: "User", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should have email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "should have first name" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "should have last name" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "should have password" do
    @user.password = ""
    assert_not @user.valid?
  end
end
