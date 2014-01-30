require 'spec_helper'

describe Iteration do
  before {
    @project = FactoryGirl.create :project
    @iteration1 = FactoryGirl.create :iteration, project: @project, sort_order: 1, status: Iteration::PAST
    @iteration2 = FactoryGirl.create :iteration, project: @project, sort_order: 2, status: Iteration::CURRENT
  }

	it 'returns project current iteration' do
    expect(Iteration.current(@project)).to eql(@iteration2)
  end

  it 'returns project previous iteration' do
    expect(Iteration.previous(@project)).to eql(@iteration1)
  end
end