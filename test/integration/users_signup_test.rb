require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { username:  "", email: "user@invalid", password: "foo"}
    end
    assert_template 'users/new'
  end
end
