require 'spec_helper'

describe "indicators/index" do
  before(:each) do
    assign(:indicators, [
      stub_model(Indicator,
        :name => "Name",
        :description => "MyText",
        :one_label => "One Label",
        :five_label => "Five Label",
        :sort_order => 1
      ),
      stub_model(Indicator,
        :name => "Name",
        :description => "MyText",
        :one_label => "One Label",
        :five_label => "Five Label",
        :sort_order => 1
      )
    ])
  end

  it "renders a list of indicators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "One Label".to_s, :count => 2
    assert_select "tr>td", :text => "Five Label".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
