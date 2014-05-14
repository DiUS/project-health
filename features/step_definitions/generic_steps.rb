Given(/^I open the new (\w*) page$/) do |page_name|
  visit '/' + page_name + "/new"
end

Given(/^I open the (\w*) page$/) do |page_name|
  visit '/' + page_name
end

Given(/^that "(.*?)" exists in categories/) do |name|
  create_category name
end

Given(/^that "(.*?)" exists in projects/) do |name|
  create_project name
end

Given(/^I open the dashboard for "(.*?)"$/) do |project_name|
  open_project_detail project_name
  click_link("View Dashboard")
end

Given(/^the project "(.*?)" has an iteration "(.*?)"$/) do |project_name, iteration_name|
  open_project_detail project_name
  fill_in "iteration_name", with:iteration_name
  find_a_submit("New Iteration").click
end


Then(/^(.*) is displayed$/) do |label|
  expect(page).to have_content(label)
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with:value
end

Then(/^I select the "Category" value "(.*?)"$/) do |value|
  select value, :from => "Category"
end

Then(/^I press "(.*?)"$/) do |button|
  find_a_submit(button).click
end

Then(/^I check "(.*?)"$/) do |checkbox|
  page.check(checkbox)
end

Then(/^I should see "([^"]*?)"$/) do |message|
  page.should have_content(message)
end

Then(/^I should not see "([^"]*?)"$/) do |message|
  page.should have_no_content(message)
end

Then(/^I should see "([^"]*)" in panel "([^"]*)"$/) do |message, panel_title|
  panel = find('div.panel-heading', text: panel_title).parent
  panel.should have_content(message)
end

Then(/^I should not see the panel "([^"]*)"$/) do |panel_title|
  page.should have_no_selector('div.panel-heading', text: panel_title)
end

def find_a_submit name
  begin
    return find_button(name)
  rescue
  end

  return find_link(name)
end

def create_category name
  create_generic_object "categories", "Create Category", { "Name" => name }
end

def create_project name
  create_generic_object "projects", "Create Project", { "Name" => name }
end

def create_generic_object resource_name, submit_name, values
  visit "/#{resource_name}/new"
  values.each do | key, value | 
    fill_in key, with:value
  end
  find_a_submit(submit_name).click
end


def open_project_detail project_name
  visit '/projects'
  row = find('td', text: project_name).parent
  row.click_link("Show")
end