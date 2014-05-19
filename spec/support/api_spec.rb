require 'rspec'

shared_examples 'an API controller' do

  before :each do
    mock_login(FactoryGirl.create :user)
  end

  describe "GET #index (rest)" do
    it "return array" do
      get :index, format: :json
      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body.length).to eq 1
      expect(body[0]['name']).to eq object.name
    end
  end

  describe "GET #show (rest)" do
    it "return object" do
      get :show, id: object.id, format: :json
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body['name']).to eq object.name
    end
  end

  describe "DELETE destroy (rest)" do
    it "delete existing object" do
      expect {
        delete :destroy, id: object.id, format: :json
      }.to change(object.class, :count).by(-1)
    end

    it "returns 204" do
      delete :destroy, id: object.id, format: :json
      expect(response.status).to eq 204
    end
  end

  describe "POST create (rest)" do

    describe "with valid attributes" do
      it "create object and return 204" do
        expect {
          post :create, valid_attributes
        }.to change(object.class, :count).by(1)
      end

      it "responds with 204" do
        post :create, valid_attributes
        expect(response.status).to be 204
      end
    end

    describe "invalid attributes" do
      it "do not modify database" do
        expect {
          post :create, invalid_attributes
        }.to change(object.class, :count).by(0)
      end

      it "responds with 422" do
        post :create, invalid_attributes
        expect(response.status).to be 422
      end

      it "responds array with error messages" do
        post :create, invalid_attributes

        body = JSON.parse(response.body)
        expect(body).to eq errors
      end
    end
  end
end