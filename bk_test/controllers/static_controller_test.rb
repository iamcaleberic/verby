require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    sign_in writers(:one)
    sign_in superusers(:one)
    @publication = publications(:one)
  end
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

end
