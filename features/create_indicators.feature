Feature: Create  indicators
  to try and get some more basic tests happening
  I am trying to test creating a indicator

  Scenario: user creates a category
    Given user opens the new categories page
    Then New category is displayed
    Then I fill in "Name" with "Testing"
    And I press "Create Category"
    Then I should see "Name: Testing"