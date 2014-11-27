require 'test_helper'

class PropertyControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

end
