require 'spec_helper'

describe Iteration do
  before {
    @project = FactoryGirl.create :project
    @iteration1 = FactoryGirl.create :iteration, project: @project, sort_order: 1, status: Iteration::PAST
    @iteration2 = FactoryGirl.create :iteration, project: @project, sort_order: 2, status: Iteration::PAST
    @iteration3 = FactoryGirl.create :iteration, project: @project, sort_order: 3, status: Iteration::CURRENT
  }

	it 'returns project current iteration' do
    expect(Iteration.current_by_project(@project)).to eql(@iteration3)
  end

  it 'returns previous iteration' do
    expect(Iteration.previous_by_iteration(@iteration2)).to eql(@iteration1)
  end
end