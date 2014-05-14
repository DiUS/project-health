Feature: Home page
  In order to get an overview of my projects
  I want to see a comprehensive list of my projects and projects on which I need to give feedback

  Background:
    Given that "My Test Project" exists in projects
    And I log in as "Steven"
    And the project "My Test Project" has an iteration "My Test Iteration"
    And "Steven" is assigned to "My Test Project"

  Scenario: I am opening my dashboard
    When I open the home page
    Then I should see "My Test Project" in panel "My projects"

  Scenario: I give feedback
    When I open the home page
    Then I should see "My Test Project My Test Iteration" in panel "Pending ratings"
    And I give feedback the iteration "My Test Iteration" in project "My Test Project"
    Then I should not see the panel "Pending ratings"
  