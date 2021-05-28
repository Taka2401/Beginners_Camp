require 'test_helper'

class CampItemValuesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get camp_item_values_new_url
    assert_response :success
  end

  test "should get create" do
    get camp_item_values_create_url
    assert_response :success
  end
end
