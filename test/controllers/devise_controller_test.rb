require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest
  test "should get Admin" do
    get devise_Admin_url
    assert_response :success
  end
end
