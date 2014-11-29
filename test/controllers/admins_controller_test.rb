require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get new_user" do
    get :new_user
    assert_response :success
  end

  test "should get create_user" do
    get :create_user
    assert_response :success
  end

end
