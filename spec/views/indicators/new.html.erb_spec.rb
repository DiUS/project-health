require 'spec_helper'

describe "indicators/new" do
  before(:each) do
    assign(:indicator, stub_model(Indicator,
      :name => "MyString",
      :description => "MyText",
      :one_label => "MyString",
      :five_label => "MyString",
      :sort_order => 1
    ).as_new_record)
  end

  it "renders new indicator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", indicators_path, "post" do
      assert_select "input#indicator_name[name=?]", "indicator[name]"
      assert_select "textarea#indicator_description[name=?]", "indicator[description]"
      assert_select "input#indicator_one_label[name=?]", "indicator[one_label]"
      assert_select "input#indicator_five_label[name=?]", "indicator[five_label]"
      assert_select "input#indicator_sort_order[name=?]", "indicator[sort_order]"
    end
  end
end
