require 'spec_helper'

describe HomeController do
  describe 'GET #index' do
    render_views

    let!(:user) {FactoryGirl.create :user}
    let!(:project1) {FactoryGirl.create :project, users: [user], iterations: FactoryGirl.create_list(:iteration, 1)}
    let!(:project2) {FactoryGirl.create :project, users: [user], iterations: FactoryGirl.create_list(:iteration, 1)}
    let!(:project3) {FactoryGirl.create :project, users: []}

    it "renders response" do
      mock_login user
      user.voted_for project2.current_iteration

      get :index

      expect(assigns(:my_projects)).to eq([project1, project2])
      expect(assigns(:pending_ratings)).to eq([project1])
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end
end
