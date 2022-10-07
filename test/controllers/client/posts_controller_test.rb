require "test_helper"

class Client::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get client_posts_show_url
    assert_response :success
  end
end
