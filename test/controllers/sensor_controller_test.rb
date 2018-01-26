require 'test_helper'

class SensorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sensor_index_url
    assert_response :success
  end

  test "should get new" do
    get sensor_new_url
    assert_response :success
  end

end
