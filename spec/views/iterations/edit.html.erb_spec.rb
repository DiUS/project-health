require 'spec_helper'

describe "iterations/edit" do
  before(:each) do
    @iteration = assign(:iteration, stub_model(Iteration,
      :name => "MyString",
      :status => "MyString",
      :sort_order => 1
    ))
  end

  it "renders the edit iteration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iteration_path(@iteration), "post" do
      assert_select "input#iteration_name[name=?]", "iteration[name]"
      assert_select "input#iteration_status[name=?]", "iteration[status]"
      assert_select "input#iteration_sort_order[name=?]", "iteration[sort_order]"
    end
  end
end
