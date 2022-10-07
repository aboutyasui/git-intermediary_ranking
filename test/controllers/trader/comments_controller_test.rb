require "test_helper"

class Trader::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trader_comments_index_url
    assert_response :success
  end
end
