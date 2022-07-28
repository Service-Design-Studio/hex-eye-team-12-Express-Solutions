Feature: Search Bar for finding services

As a DBS Customer;
I want to be able to quickly key in the service I want;
So that I can save time and energy from scouring the web.

Background: Services have been added to database

    Given the data in "clean_txn.csv"
    And I visit "/services"

@javascript
Scenario: Customer keys in matching search terms (autocomplete)
Given I type in "Update" into the search bar
Then I should see "Update Phone" in the dropdown
When I click on the "Update Phone" in the dropdown
Then I should see the headers "Update Phone, Get it done with Digibank in, Wait in the Queue"

@javascript
Scenario: Customer keys in non-matching search terms (ML)
Given I type in "change " into the search bar
And I should not see "change" in the dropdown
And I should see "Update ATM Card" in the dropdown
Then I click on the "Update ATM Card" in the dropdown
And I should see the headers "Update ATM Card, Wait in the Queue"

@javascript
Scenario: Customer selects wrong service and returns to main page
Given I type in "Update" into the search bar
When I click on the "Update Address" in the dropdown
And I should see the headers "Update Address, Get it done with Digibank in, Wait in the Queue"
Then I go back
And I will see "Update Address" in the search bar

@javascript
Scenario: Customer does not find keyword in the search bar
Given I type in "randomstuff" into the search bar
Then I should see "No results found" in the dropdown
And I click on the "card" of "General Services"
Then I should see the headers "Unable to find the service that you need?"
