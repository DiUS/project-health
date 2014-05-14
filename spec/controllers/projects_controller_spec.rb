require 'rspec'

describe ProjectsController do
  let(:project) {FactoryGirl.create :project}
  let(:user) {FactoryGirl.create :user}
  let(:indicator) {FactoryGirl.create :indicator}

  it_behaves_like "a CRUD controller" do
    let(:object_instance) {FactoryGirl.create :project}
    let(:class_object) {Project}
    let(:object_type) {:project}
    let(:valid_attributes) {{:name => "Test Project"}}
    let(:invalid_attributes) {{:name => ""}}
  end

  describe "POST update_users" do
    it "links users" do
      post :update_users, project_id:project.id, users:[user.id]
      project.reload

      expect(project.users).to eq [user]
    end

    it "clear users" do
      project.users = [user];
      project.save!

      post :update_users, project_id:project.id, users:[]
      project.reload

      expect(project.users).to be_empty
    end
  end

  describe "POST update_indicators" do
    it "link indicators" do
      post :update_indicators, project_id:project.id, indicators:[indicator.id]
      project.reload

      expect(project.indicators).to eq [indicator]
    end

    it "clear indicators" do
      project.indicators = [indicator];
      project.save!

      post :update_indicators, project_id:project.id, indicators:[]
      project.reload

      expect(project.indicators).to be_empty
    end
  end
end