require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create :project }

	it 'adds a first iteration to project' do
    iteration = project.add_iteration('Iteration 1')

    expect(iteration.sort_order).to eql(1)
    expect(iteration.name).to eql('Iteration 1')
    expect(iteration.project).to eql(project)
    expect(iteration.status).to eql(Iteration::CURRENT)
  end

  it 'adds a second iteration to project' do
    iteration1 = project.add_iteration('Iteration 1')
    iteration2 = project.add_iteration('Iteration 2')

    iteration1.reload
    iteration2.reload

    expect(iteration1.status).to eql(Iteration::PAST)
    expect(iteration2.status).to eql(Iteration::CURRENT)
    expect(iteration2.sort_order).to eql(2)
  end

end