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

  test "slug is auto-generated on save" do
    pub = Publication.create(title: "A joke", body: "A foo walked into a bar", pen_name: "anon")
    assert pub.valid?
    pub.destroy
  end

  test "new slug is generated when dependants [title,pen_name] change" do
    pub = publications(:one)
    pub.save
    assert_equal 'title_one-by-pen_name_one', pub.slug

    # pen name change
    pub.pen_name = 'anon'
    pub.save
    assert_equal 'title_one-by-anon', pub.slug

    # title change
    pub.title = 'new_title'
    pub.save
    assert_equal 'new_title-by-anon', pub.slug

    # nillified slug
    pub.slug = nil
    pub.save
    assert_equal 'new_title-by-anon', pub.slug
  end
end
