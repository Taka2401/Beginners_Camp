require 'test_helper'

class Admins::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_reservations_show_url
    assert_response :success
  end
end
