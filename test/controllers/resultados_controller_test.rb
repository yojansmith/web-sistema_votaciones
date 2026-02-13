require "test_helper"

class ResultadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resultados_index_url
    assert_response :success
  end
end
