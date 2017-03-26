require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post = Post.new(user: create(:user), content: "This is a post")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should have a user" do
    @post.user = nil
    assert_not @post.valid?
  end

  test "should have content" do
    @post.content = ""
    assert_not @post.valid?
  end
end
