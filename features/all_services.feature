Feature: Display & Navigation for all Banking Services

As a DBS Customer
I want to be able to find the service without hassle
So that my banking needs can be fulfilled in a timely manner

Background: Categories have been added to database
    
    Given the data in test_global_prediction.csv
    And the data in clean_txn.csv
    And the data in branch.csv
    And I am using web

Scenario: Customer uses a web link to access the One-Stop Service page 
    When I visit "/services"
    Then I should see the headers "Is this what you are looking for?, Categories"

#Dynamic Branch Naming

Scenario: Customer goes to MBFC branch and scans QR Code
    When I visit "/services?branch=MBFC"
    Then I should see the headers "MBFC Branch"

Scenario: Customer tries a random url of our web service #sad path
    When I visit "/randomsite"
    Then I should see the headers "Is this what you are looking for?"
    Then I should not see the headers "randomsite"

#----------------------------------------------------------------------------------------------------

Scenario: Customer can't find his service on Main Page #sad path
    When I visit "/services"
    Then I click on the "card" of "General Services"
    Then I should see the headers "Unable to find the service that you need?"