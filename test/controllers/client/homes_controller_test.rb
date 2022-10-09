require "test_helper"

class Client::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_homes_index_url
    assert_response :success
  end
end
