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
Then I should not see "change" in the dropdown
But I should see "Update Particulars" in the dropdown
Then I click on the "Update Particulars" in the dropdown
And I should see the headers "Update Particulars, Get it done with Digibank in, Wait in the Queue"

@javascript
Scenario: Customer selects wrong service and returns to main page
Given I type in "Update" into the search bar
When I click on the "Update Phone" in the dropdown
And I should see the headers "Update Phone, Get it done with Digibank in, Wait in the Queue"
Then I go back
And I will see "Update" in the search bar

# Scenario: Customer does not find keyword in the search bar
# Given I type in "1234567890" into the search bar
# When I see the dropdown without any options
# Then I should see "No results found" in the dropdown
# And I click on the "button" of "More"
# Then I should see the headers "More"
