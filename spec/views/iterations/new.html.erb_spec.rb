require 'spec_helper'

describe "iterations/new" do
  before(:each) do
    assign(:iteration, stub_model(Iteration,
      :name => "MyString",
      :status => "MyString",
      :sort_order => 1
    ).as_new_record)
  end

  it "renders new iteration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", iterations_path, "post" do
      assert_select "input#iteration_name[name=?]", "iteration[name]"
      assert_select "input#iteration_status[name=?]", "iteration[status]"
      assert_select "input#iteration_sort_order[name=?]", "iteration[sort_order]"
    end
  end
end
