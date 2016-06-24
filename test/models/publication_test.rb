require 'test_helper'

class PublicationTest < ActiveSupport::TestCase

  # test is a publication has a title , body , pen_name
  test 'should not post publication without title body and pen_name' do
    publication = Publication.new
    assert_not publication.valid?
    assert_equal [:title, :body, :pen_name], publication.errors.keys
  end
end
