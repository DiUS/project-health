require 'spec_helper'

describe "iterations/index" do
  before(:each) do
    assign(:iterations, [
      stub_model(Iteration,
        :name => "Name",
        :status => "Status",
        :sort_order => 1
      ),
      stub_model(Iteration,
        :name => "Name",
        :status => "Status",
        :sort_order => 1
      )
    ])
  end

  it "renders a list of iterations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
