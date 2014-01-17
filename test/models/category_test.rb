require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without a name" do
    category = Category.new
    assert !category.save, "Saved without a name"
  end
end
