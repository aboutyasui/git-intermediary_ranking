require "test_helper"

class Client::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get client_comments_edit_url
    assert_response :success
  end
end
