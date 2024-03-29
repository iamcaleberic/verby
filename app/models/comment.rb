class Comment < ApplicationRecord
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates :body, :presence => true
  validates :writer, :presence => true

  # NOTE: install the acts_as_votable plugin if you
  # want writer to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a writer
  belongs_to :writer
  acts_as_votable
  # Helper class method that allows you to build a comment
  # by passing a commentable object, a writer_id, and comment text
  # example in readme
  def self.build_from(obj, writer_id, comment)
    new \
      :commentable => obj,
      :body        => comment,
      :writer_id     => writer_id
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.any?
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given writer.
  scope :find_comments_by_writer, lambda { |writer|
    where(:writer_id => writer.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
end
