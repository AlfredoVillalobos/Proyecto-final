require 'test_helper'

class GeocoderControllerTest < ActionDispatch::IntegrationTest
  test "should get localposittion" do
    get geocoder_localposittion_url
    assert_response :success
  end

end
