require 'spec_helper'

describe Api::IndicatorsController do
  let!(:indicator) {FactoryGirl.create :indicator}

  before :each do
    mock_login(FactoryGirl.create :user)
  end

  describe "GET #index (rest)" do
    it "return array" do
      get :index, format: :json
      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body.length).to eq 1
      expect(body[0]['name']).to eq indicator.name
    end
  end

  describe "GET #show (rest)" do
    it "return object" do
      get :show, id: indicator.id, format: :json
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body['name']).to eq indicator.name
    end
  end

  describe "DELETE destroy (rest)" do
    it "delete existing object" do
      expect {
        delete :destroy, id: indicator.id, format: :json
      }.to change(Indicator, :count).by(-1)
    end

    it "returns 204" do
      delete :destroy, id: indicator.id, format: :json
      expect(response.status).to eq 204
    end
  end

  describe "POST create (rest)" do
    let(:category) {FactoryGirl.create :category}

    describe "with valid attributes" do
      let(:valid_attributes) {{name: "Test via API", category_id: category.id, description: "Test"}}

      it "create object and return 204" do
        expect {
          post :create, valid_attributes
        }.to change(Indicator, :count).by(1)
      end

      it "responds with 204" do
        post :create, valid_attributes
        expect(response.status).to be 204
      end
    end

    describe "invalid attributes" do
      let(:invalid_attributes) {{name: "Test via API"}}

      it "do not modify database" do
        expect {
          post :create, invalid_attributes
        }.to change(Category, :count).by(0)
      end

      it "responds with 422" do
        post :create, invalid_attributes
        expect(response.status).to be 422
      end

      it "responds array with error messages" do
        post :create, invalid_attributes

        body = JSON.parse(response.body)
        expect(body).to eq ["Category can't be blank"]
      end
    end
  end
end
