require 'test_helper'

class CampsInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get camps_info_index_url
    assert_response :success
  end

  test "should get show" do
    get camps_info_show_url
    assert_response :success
  end
end
