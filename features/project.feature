Feature:Projects
  In order to do any kind of testing I need to verify that Cucumber can run
  A user Should be able to open the project

  Scenario: user opens the projects
    Given I open the projects page
    Then Listing projects is displayed

  Scenario: user creates a project
    Given I open the new projects page
    And I fill in "project_name" with "Project 1"
    And I press "Create Project"
    Then I should see "Project was successfully created."

  Scenario: user deletes project
    Given that "Test Project" exists in projects
    When I open the projects page
    And I press "Destroy"
    Then I should not see "Test Project"
