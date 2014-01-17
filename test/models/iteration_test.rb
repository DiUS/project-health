require 'test_helper'

class IterationTest < ActiveSupport::TestCase
  test "should not save iteration without a project" do
    iteration = Iteration.new
    iteration.name='Test Iteration'
    assert !iteration.save, "Saved without a project"
  end

  test "should not save iteration without a name" do
    iteration = Iteration.new
    iteration.project= Project.find_or_initialize_by(name: 'Project One')
    assert !iteration.save, "Saved without a name"
  end

  test "should save iteration with a project and name" do
    iteration = Iteration.new
    iteration.name='Test Iteration'
    iteration.project= Project.find_or_initialize_by(name: 'Project One')
    assert iteration.save, "couldnt save with a iteration and name"
  end
end
