require "test_helper"

class Vendor::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get vendor_homes_top_url
    assert_response :success
  end
end
