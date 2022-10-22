require "test_helper"

class Trader::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trader_homes_index_url
    assert_response :success
  end
end
