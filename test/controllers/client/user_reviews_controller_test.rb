require "test_helper"

class Client::UserReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_user_reviews_index_url
    assert_response :success
  end
end
