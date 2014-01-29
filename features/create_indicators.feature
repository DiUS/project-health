Feature: Create  indicators
  to try and get some more basic tests happening
  I am trying to test creating a indicator

  Scenario: user creates a category
    Given user opens the new categories page
    Then New category is displayed
    Then I fill in "Name" with "Testing"
    And I press "Create Category"
    Then I should see "Name: Testing"

  Scenario: user creates an indicator
    Given that "Technical" exists in categories
    And user opens the new indicators page
    Then I fill in "Name" with "Test Indicator"
    And I select the "Category" value "Technical"
    And I fill in "Sort order" with "13"
    And I press "Create Indicator"
    Then I should see "Name: Test Indicator"
    And I should see "Category: Technical"
