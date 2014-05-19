require 'spec_helper'

describe Api::IndicatorsController do
  let!(:object) {FactoryGirl.create :indicator}

  let(:category) { FactoryGirl.create :category }
  let(:valid_attributes) { {name: "Test via API", category_id: category.id, description: "Test"} }

  let(:invalid_attributes) { {name: "Test via API"} }
  let(:errors) { ["Category can't be blank"] }

  it_behaves_like 'an API controller'

end
