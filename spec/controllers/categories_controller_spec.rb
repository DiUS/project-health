require 'spec_helper'

describe CategoriesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "can create a new category" do
      post :create, category: {:name => 'Test Cat'}
      expect(response).to be_redirect
    #  expect(page).to have_text('Category was successfully created.')
    end
  end
end