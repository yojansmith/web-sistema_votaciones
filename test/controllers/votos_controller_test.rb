require "test_helper"

class VotosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get votos_create_url
    assert_response :success
  end
end
