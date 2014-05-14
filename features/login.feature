Feature: User Login
  In order to allow users access to a personalised dashboard
  and to prevent users from giving feedback for the same iteration multiple times
  a user needs to authenticate against the application
  
  Scenario: user logs in via Google
  When I am logged in as "Steve"
  Then I should see "Hello, Steve!"
  Then I press "Log out"
  