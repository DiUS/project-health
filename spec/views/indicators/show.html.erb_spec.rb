require 'spec_helper'

describe "indicators/show" do
  before(:each) do
    @indicator = assign(:indicator, stub_model(Indicator,
      :name => "Name",
      :description => "MyText",
      :one_label => "One Label",
      :five_label => "Five Label",
      :sort_order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/One Label/)
    rendered.should match(/Five Label/)
    rendered.should match(/1/)
  end
end
