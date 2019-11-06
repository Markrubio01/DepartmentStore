require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get store_welcome_url
    assert_response :success
  end

end
