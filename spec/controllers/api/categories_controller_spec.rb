require 'spec_helper'

describe Api::CategoriesController do
  let!(:object) {FactoryGirl.create :category}

  let(:valid_attributes) { {name: "Test via API"} }
  
  let(:invalid_attributes) { {} }
  let(:errors) { ["Name can't be blank"] }

  it_behaves_like 'an API controller'

end
