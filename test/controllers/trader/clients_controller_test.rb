require "test_helper"

class Trader::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trader_clients_index_url
    assert_response :success
  end

  test "should get show" do
    get trader_clients_show_url
    assert_response :success
  end
end
