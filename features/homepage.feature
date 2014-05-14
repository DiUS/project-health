Feature: Home page and rating
  In order to get an overview of my projects
  I want to see a comprehensive list of my projects and projects on which I need to give feedback

  Background:
    Given I am logged in as "Steve"
    And that "My Test Project" exists in projects
    And the project "My Test Project" has an iteration "My Test Iteration"
    And "Steve" is assigned to "My Test Project"

  Scenario: I am opening my dashboard
    When I open the home page
    Then I should see "My Test Project" in panel "My projects"

  Scenario: I give feedback
    When I open the home page
    Then I should see "My Test Project My Test Iteration" in panel "Pending ratings"
    And I give feedback the iteration "My Test Iteration" in project "My Test Project"
    Then I should not see the panel "Pending ratings"
  