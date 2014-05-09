require 'spec_helper'

describe RatingsController do
  let(:project) {FactoryGirl.create :project, indicators: [indicator1, indicator2]}
  let!(:iteration) {FactoryGirl.create :iteration, project: project, status: Iteration::CURRENT }
  let(:user) {FactoryGirl.create :user}
  let(:indicator1) {FactoryGirl.create :indicator}
  let(:indicator2) {FactoryGirl.create :indicator}

  describe "GET index" do
    subject { get :index, {project_id: project.id} }
    
    context "logged out" do
      it "redirects to login page when unauthenticated" do
        expect(subject).to redirect_to SessionsHelper.login_path
      end
    end

    context "logged in" do
      before :each do
        mock_login
      end
      
      context "not voted yet" do
        it "renders voting page" do
          expect(subject).to render_template("index")
        end
      end
      
      context "already voted" do
        before :each do
          user.voted_for iteration
        end
        
        it "renders already voted page" do
          expect(subject).to render_template("already_voted")
        end
      end
    end
  end
  
  describe "POST create" do
    context "logged in" do
      before :each do
        mock_login
      end
      
      it "save ratings" do
        post :create, {
          project_id: project.id,
          scores:   {"#{indicator1.id}" => 5},
          comments: {"#{indicator2.id}" => "Test"}
        }
        
        expect(Rating.where(iteration: iteration, indicator:indicator1, score:5).count).to eq(1)
        expect(Comment.where(iteration: iteration, indicator:indicator2, comment: "Test").count).to eq(1)
        expect(CompletedUserVote.where(user: user, iteration:iteration).count).to eq(1)
      end
    end
  end
  
  private
  def mock_login
    session.stub(:[]).with(anything).and_call_original
    session.stub(:[]).with(:user_id).and_return user.id
  end
end