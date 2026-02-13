require "test_helper"

class CargosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cargos_index_url
    assert_response :success
  end

  test "should get show" do
    get cargos_show_url
    assert_response :success
  end
end
