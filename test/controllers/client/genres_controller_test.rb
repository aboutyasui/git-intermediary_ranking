require "test_helper"

class Client::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get client_genres_show_url
    assert_response :success
  end
end
