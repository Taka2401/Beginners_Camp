require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get devise" do
    get admins_devise_url
    assert_response :success
  end
end
