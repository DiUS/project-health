require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create :project }

	it 'adds a first iteration to project' do
    iteration = project.add_iteration('Iteration 1')

    iteration.sort_order.should eql(1)
    iteration.name.should eql('Iteration 1')
    iteration.project.should eql(project)
    iteration.status.should eql(Iteration::CURRENT)
  end

  it 'adds a second iteration to project' do
    iteration1 = project.add_iteration('Iteration 1')
    iteration2 = project.add_iteration('Iteration 2')

    iteration1.reload
    iteration2.reload

    iteration1.status.should eql(Iteration::PAST)
    iteration2.status.should eql(Iteration::CURRENT)
    iteration2.sort_order.should eql(2)
  end

end