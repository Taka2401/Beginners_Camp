require 'test_helper'

class CampPlaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get camp_place_index_url
    assert_response :success
  end

  test "should get show" do
    get camp_place_show_url
    assert_response :success
  end
end
