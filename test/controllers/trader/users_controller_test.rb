require "test_helper"

class Trader::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trader_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get trader_users_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get trader_users_unsubscribe_url
    assert_response :success
  end
end
