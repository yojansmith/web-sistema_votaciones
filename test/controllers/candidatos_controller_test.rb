require "test_helper"

class CandidatosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get candidatos_index_url
    assert_response :success
  end

  test "should get show" do
    get candidatos_show_url
    assert_response :success
  end
end
