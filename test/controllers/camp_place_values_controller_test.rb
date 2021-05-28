require 'test_helper'

class CampPlaceValuesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get camp_place_values_new_url
    assert_response :success
  end

  test "should get edit" do
    get camp_place_values_edit_url
    assert_response :success
  end

  test "should get create" do
    get camp_place_values_create_url
    assert_response :success
  end

  test "should get update" do
    get camp_place_values_update_url
    assert_response :success
  end

  test "should get destroy" do
    get camp_place_values_destroy_url
    assert_response :success
  end
end
