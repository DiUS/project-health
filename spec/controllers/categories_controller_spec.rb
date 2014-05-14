require 'spec_helper'

describe CategoriesController do
  it_behaves_like "a CRUD controller" do
    let(:object_instance) {FactoryGirl.create :category}
    let(:class_object) {Category}
    let(:object_type) {:category}
    let(:valid_attributes) {{:name => "Test Category"}}
    let(:invalid_attributes) {{:name => ""}}
  end
end