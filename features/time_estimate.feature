Feature: Display and compare time-estimate for the digital and branch services.

As a DBS Customer
I want to to know how long it takes to complete a banking service;
So that I can save time to do other things

Background: Services have been added to database
    
    Given the date and time is "2022, 8, 3, 0, 0, 0"
    And the data in test_global_prediction.csv
    And the data in clean_txn.csv
    And the data in branch.csv
    
Scenario: Customer checks a migratable service
    When I am using web
    Given I visit "/services"
    When I click on the "service" of "Update Phone"
    Then I should see the headers "Update Phone, Get it done with Digibank in, Wait in the Queue"

Scenario: Customer checks the non-migratable service
    When I am using web
    Given I visit "/services?branch=ChoaChuKang"
    When I click on the "service" of "Update Debit Card"
    Then I should see the headers "Update Debit Card, Wait in the Queue"
    And I should not see the headers "Get it done with Digibank in"

#Customer will see the time estimate dynamically change based on the branch
@javascript
Scenario: Customer chooses another branch
    Given I visit "/services?branch=ChoaChuKang"
    When I click on the "service" of "Update Debit Card"
    Then I should see the branch time estimate with "14 min"
    When I select the branch of "Bukit Batok Central Branch" in the dropdown
    Then I should see the branch time estimate with "10 min"
    And I should not see the branch time estimate with "14 min"