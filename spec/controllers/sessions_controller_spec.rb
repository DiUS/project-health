require 'spec_helper'

describe SessionsController do

  describe "GET #create" do
    let(:omniauth_hash) {FactoryGirl.build :omniauth_hash}
    let(:user) {FactoryGirl.create :user}

    it "delegates user creation" do
      request.env['omniauth.auth'] = omniauth_hash
      User.should_receive(:find_or_create_from_google_auth_hash).with(omniauth_hash).and_return user
      get :create

      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe 'GET #destroy' do
    it "empties session" do
      get :destroy
      expect(session).to be_empty
    end

    it "redirect to root page" do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end
