require "test_helper"

class Trader::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trader_reviews_index_url
    assert_response :success
  end
end
