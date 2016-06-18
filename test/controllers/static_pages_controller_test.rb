require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "/"
    assert_response :success
    assert_select "title", "Projectz! Home"
  end

  test "should get help" do
    get "/help"
    assert_response :success
    assert_select "title", "Projectz! Help"
  end

  test "should get contact" do
    get "/contact"
    assert_response :success
    assert_select "title", "Projectz! Contact"
  end

end
