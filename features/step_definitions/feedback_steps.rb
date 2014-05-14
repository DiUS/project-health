And(/^I give feedback the iteration "(.*)" in project "(.*)"$/) do |iteration_name, project_name|
  steps %Q{
    When I open the home page
    Then I press "#{project_name} #{iteration_name}"
    Then I press "Vote"
  }
end

And(/^"([^"]*)" is assigned to "([^"]*)"$/) do |user, project|
  steps %Q{
    And I open the projects page
    And I press "Show"
    And I check "#{user}"
    And I press "Update Staff"
  }
end