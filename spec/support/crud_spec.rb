require 'rspec'

shared_examples 'a CRUD controller' do
  render_views

  describe "POST #destroy" do
    it "removes object from database" do
      object_instance.save!

      expect {
        delete :destroy, :id => object_instance.id
      }.to change(class_object, :count).by(-1)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create a new object in database" do
        expect {
          post :create, object_type => valid_attributes
        }.to change(class_object, :count).by(1)
      end

      it "redirects and shows flash" do
        post :create, object_type => valid_attributes
        expect(response).to be_redirect
        expect(flash[:notice]).to match 'was successfully created.'
      end
    end

    context "with invalid attributes" do
      it "does not create objects in database" do
        expect {
          post :create, object_type => invalid_attributes
        }.to change(class_object, :count).by(0)
      end

      it "does not redirect" do
        post :create, object_type => invalid_attributes
        expect(response.body).to match "Verification error"
      end
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: object_instance.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end