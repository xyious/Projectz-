require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "Example User", email: "user@example.com", password: "password"} }
      follow_redirect!
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
