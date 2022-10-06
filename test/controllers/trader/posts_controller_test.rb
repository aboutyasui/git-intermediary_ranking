require "test_helper"

class Trader::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trader_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get trader_posts_edit_url
    assert_response :success
  end
end
