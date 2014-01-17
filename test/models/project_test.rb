require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save a project without a name" do
    project = Project.new
    assert !project.save, "Saved without a name"
  end

  test "should save a project with a name" do
    project = Project.new
    project.name='Test Project'
    assert project.save, "couldnt save with a name"
  end
end
