Given(/^user opens the (.*) page$/) do |page_name|
  visit '/' + page_name
end

Then(/^(.*) is displayed$/) do |label|
  expect(page).to have_content(label)
end