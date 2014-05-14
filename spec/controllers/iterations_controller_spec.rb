require 'spec_helper'

describe IterationsController do
  let(:project) {FactoryGirl.create :project}

  it_behaves_like "a CRUD controller" do
    let(:object_instance) {FactoryGirl.create :iteration}
    let(:class_object) {Iteration}
    let(:valid_attributes) {{project_id: project.id, :name => "Test Iteration"}}
    let(:invalid_attributes) {{:name => ""}}
    let(:object_type) {:iteration}
  end
end