require "test_helper"

class Client::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get client_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get client_users_edit_url
    assert_response :success
  end
end
