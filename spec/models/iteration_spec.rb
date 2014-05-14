require 'spec_helper'

describe Iteration do
    let(:project_with_three_iteration)  {FactoryGirl.create :project}
    let!(:iteration1) {FactoryGirl.create :iteration, project: project_with_three_iteration}
    let!(:iteration2) {FactoryGirl.create :iteration, project: project_with_three_iteration}
    let!(:iteration3) {FactoryGirl.create :iteration, project: project_with_three_iteration}

    let(:project_without_iteration)  {FactoryGirl.create :project, iterations: []}


	it 'returns project current iteration' do
    expect(Iteration.current_by_project(project_with_three_iteration)).to eql(iteration3)
  end

  it 'returns previous iteration' do
    expect(Iteration.previous_by_iteration(iteration2)).to eql(iteration1)
  end


  describe 'create' do
    describe 'a first iteration' do
      let(:project_without_iteration) {FactoryGirl.create :project}
      subject {
        Iteration.create!({name: 'Iteration 1', project: project_without_iteration})
      }

      its(:name) { should eq 'Iteration 1' }
      its(:sort_order) { should be 1}
      its(:project) { should be project_without_iteration}
      its(:status) { should be Iteration::CURRENT}
    end

    describe 'another iteration' do
      let(:project_with_one_iteration) {FactoryGirl.create :project}
      let!(:iteration1) {FactoryGirl.create :iteration, project: project_with_one_iteration}

      subject {
        Iteration.create!({name: 'Iteration 2', project: project_with_one_iteration})
      }

      its(:status) {should eq Iteration::CURRENT}
      its(:sort_order) {should be 2}

      it 'old iteration is marked as PAST' do
        subject #force initialisation
        iteration1.reload

        expect(iteration1.status).to eql(Iteration::PAST)
      end
    end
  end
end