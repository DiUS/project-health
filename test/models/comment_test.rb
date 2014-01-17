require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without a comment" do
    comment = Comment.new
    assert !comment.save, "Saved without a comment"
  end
end
