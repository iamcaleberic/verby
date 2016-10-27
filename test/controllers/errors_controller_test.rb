require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    sign_in writers(:one)
    sign_in superusers(:one)
    @publication = publications(:one)
  end


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
