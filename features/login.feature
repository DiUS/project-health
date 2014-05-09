Feature: User Login
  In order to allow users access to a personalised dashboard
  and to prevent users from giving feedback for the same iteration multiple times
  a user needs to authenticate against the application
  
  Scenario: user logs in via Google
  When test user Steve Heartmaker logs in
  Then he should be greeted by "Hello Steve"