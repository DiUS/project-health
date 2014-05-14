require 'spec_helper'

describe IndicatorsController do
  let(:category) {FactoryGirl.create :category}

  it_behaves_like "a CRUD controller" do
    let(:object_instance) {FactoryGirl.create :indicator}
    let(:class_object) {Indicator}
    let(:object_type) {:indicator}
    let(:valid_attributes) {{:name => "Test Indicator", category_id: category.id}}
    let(:invalid_attributes) {{:category_id => ""}}
  end
end