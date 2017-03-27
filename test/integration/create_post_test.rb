require 'test_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

class CreatePostTest < ActionDispatch::IntegrationTest

  def setup
    @user = create(:user)
    @user.confirm
  end

  test "creating post from profile page" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select "form[action=?]", posts_path
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: ""}}
    end
    assert_not flash.empty?
    assert_redirected_to user_path(@user)
    assert_difference 'Post.count' do
      post posts_path, params: { post: { content: "This is a post"}}
    end
    assert_not flash.empty?
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_select 'div.post', count: 1
  end
end