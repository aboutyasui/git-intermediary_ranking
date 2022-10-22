require "test_helper"

class Client::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get client_reviews_new_url
    assert_response :success
  end

  test "should get show" do
    get client_reviews_show_url
    assert_response :success
  end

  test "should get edit" do
    get client_reviews_edit_url
    assert_response :success
  end
end
