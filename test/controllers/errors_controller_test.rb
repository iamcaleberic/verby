require 'test_helper'
Devise::Test::ControllerHelpers
class ErrorsControllerTest < ActionController::TestCase
  test "should get not_found" do
    get :not_found
    assert_response :success
  end

  test "should get internal_server" do
    get :internal_server
    assert_response :success
  end

  test "should get unauthorized" do
    get :unauthorized
    assert_response :success
  end

end
