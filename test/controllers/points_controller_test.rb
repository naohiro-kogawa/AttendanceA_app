require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get points_update_url
    assert_response :success
  end

  test "should get destroy" do
    get points_destroy_url
    assert_response :success
  end

  test "should get create" do
    get points_create_url
    assert_response :success
  end

end
