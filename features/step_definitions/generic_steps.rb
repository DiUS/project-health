Given(/^user opens the new (\w*) page$/) do |page_name|
  visit '/' + page_name + "/new"
end

Given(/^user opens the (\w*) page$/) do |page_name|
  visit '/' + page_name
end

Then(/^(.*) is displayed$/) do |label|
  expect(page).to have_content(label)
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with:value
end

Then(/^I press "(.*?)"$/) do |button|
  find_a_button(button).click
end

Then(/^I should see "(.*?)"$/) do |message|
  page.should have_content(message)
end

def find_a_button name
  begin
    return find_button(name)
  rescue
  end

  return find_link(name)
end