ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest

  def log_in_as(user, password = 'password', remember_me = '1')
    post user_session_path, params: { user: { email: user.email,
                                                  password: password,
                                                  remember_me: remember_me}}
  end

end