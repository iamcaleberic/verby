require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    sign_in writers(:one)
    sign_in superusers(:one)
    @publication = publications(:one)
  end


end
