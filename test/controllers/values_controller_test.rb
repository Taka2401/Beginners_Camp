require 'test_helper'

class ValuesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get values_new_url
    assert_response :success
  end

  test "should get edit" do
    get values_edit_url
    assert_response :success
  end

  test "should get create" do
    get values_create_url
    assert_response :success
  end

  test "should get update" do
    get values_update_url
    assert_response :success
  end

  test "should get destroy" do
    get values_destroy_url
    assert_response :success
  end

end
