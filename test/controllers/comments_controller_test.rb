require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    sign_in writers(:one)
    sign_in superusers(:one)
    @publication = publications(:one)
  end
  
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get upvote" do
    get :upvote
    assert_response :success
  end

  test "should get downvote" do
    get :downvote
    assert_response :success
  end

end
