require 'test_helper'

class CampsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get camps_top_url
    assert_response :success
  end

  test "should get about" do
    get camps_about_url
    assert_response :success
  end

  test "should get show" do
    get camps_show_url
    assert_response :success
  end
end
