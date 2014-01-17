require 'test_helper'

class ProjectIndicatorTest < ActiveSupport::TestCase
  test "should save project_indicator with a project and an indicator" do
    project_indicator= ProjectIndicator.new
    project_indicator.indicator= Indicator.find_or_initialize_by(name: 'Tech Debt')
    project_indicator.project= Project.find_or_initialize_by(name: 'Project One')
    assert project_indicator.save, "couldnt save with a project and an indicator"
  end
end
