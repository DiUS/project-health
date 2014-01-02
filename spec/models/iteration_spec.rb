require 'spec_helper'

describe Iteration do
  before {
    @project = FactoryGirl.create :project
    @iteration1 = FactoryGirl.create :iteration, project: @project, sort_order: 1, status: Iteration::PAST
    @iteration2 = FactoryGirl.create :iteration, project: @project, sort_order: 2, status: Iteration::CURRENT
  }

	it 'returns project current iteration' do
    Iteration.current(@project).should eql(@iteration2)
  end

  it 'returns project previous iteration' do
    Iteration.previous(@project).should eql(@iteration1)
  end
end