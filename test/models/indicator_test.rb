require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase
  test "should not save indicator without a name" do
    indicator = Indicator.new
    indicator.category= Category.find_or_initialize_by(name: 'Technical')
    assert !indicator.save, "Saved without a name"
  end

  test "should not save indicator without a category" do
    indicator = Indicator.new
    indicator.name='Test'
    assert !indicator.save, "Saved without a category"
  end

  test "should save indicator with a category and name" do
    indicator = Indicator.new
    indicator.name='Test'
    indicator.category= Category.find_or_initialize_by(name: 'Technical')
    assert indicator.save, "couldnt save with a category and name"
  end
end
