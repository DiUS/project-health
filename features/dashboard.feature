Feature: Dashboard
  to analyse and visualise a projects health,
  the user should see a project specific dash board
  
  Scenario: user opens dashboard
  Given that "Test Project" exists in projects
  And the project "Test Project" has an iteration "Iteration 1"
  And the project "Test Project" has an iteration "Iteration 2"
  And I open the dashboard for "Test Project"
  Then Test Project - Iteration 2 is displayed
  Then I press "Iteration 1"
  Then Test Project - Iteration 1 is displayed