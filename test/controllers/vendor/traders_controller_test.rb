require "test_helper"

class Vendor::TradersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get vendor_traders_show_url
    assert_response :success
  end

  test "should get edit" do
    get vendor_traders_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get vendor_traders_unsubscribe_url
    assert_response :success
  end
end
