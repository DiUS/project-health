require 'rspec'

describe DashboardController do
  let(:project) {FactoryGirl.create :project}
  let!(:iteration) {FactoryGirl.create :iteration, project: project, status: Iteration::CURRENT}

  before :each do
    mock_login(FactoryGirl.create :user)
  end

  describe "GET index" do
    render_views

    it 'get by project' do
      get :index, project_id: project.id
      expect(response).to be_success
    end

    it 'get by project and iteration' do
      get :index, project_id: project.id, iteration_id: iteration.id
      expect(response).to be_success
    end

    describe 'project without iteration' do
      it 'is rendered successfully' do
        project_without_iterations = FactoryGirl.create :project, iterations: [];
        get :index, project_id: project_without_iterations.id
        expect(response).to be_success
      end
    end
  end
end