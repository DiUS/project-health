require 'spec_helper'

describe "iterations/show" do
  before(:each) do
    @iteration = assign(:iteration, stub_model(Iteration,
      :name => "Name",
      :status => "Status",
      :sort_order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Status/)
    rendered.should match(/1/)
  end
end
