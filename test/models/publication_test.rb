require 'test_helper'

class PublicationTest < ActiveSupport::TestCase

  # test is a publication has a title , body , pen_name
  test 'should not post publication without title body and pen_name' do
    publication = Publication.new
    assert_not publication.valid?
    assert_equal [:title, :body, :pen_name], publication.errors.keys
  end
  test "Publication doesn't save without all parameters" do
    publication = Publication.create(title: 'Post title')
    assert_not publication.valid?, 'The publication should not be valid when missing body'
  end
  test "poop is acceptable" do
    assert_nothing_raised do
      @publication = publications(:two)
    end
  end  

end
