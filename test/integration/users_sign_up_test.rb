require 'test_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    DatabaseCleaner.clean
  end

  test "signup with invalid information" do
    get new_user_registration_path
    assert_template 'devise/registrations/new'
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: { email: '',
                                                      password: "",
                                                      password_confirmation: ""}}
    end
    assert_template 'devise/registrations/new'
    assert_select 'div#error_explanation'
  end

  test "signup with valid information" do
    get new_user_registration_path
    assert_template 'devise/registrations/new'
    assert_difference 'User.count' do
      post user_registration_path, params: { user: { email: "user@example.com",
                                                      first_name: "Test",
                                                      last_name: "User",
                                                      password: "password",
                                                      password_confirmation: "password"}}
    end
    user = assigns(:user)
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
end