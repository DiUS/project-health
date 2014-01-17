Feature: Start Page
  In order to do any kind of testing I need to verify that Cucumber can run
  A user Should be able to open the start page (Dashboard)

  Scenario: user opens the projects page
    Given user opens the projects page
    Then Listing projects is displayed