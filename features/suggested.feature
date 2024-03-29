Feature: Display suggested services

As a DBS Customer
I want to have the most time-relevant service recommended to me
So that I can quickly get to the service I want.

Background: Services have been added to database

    Given the data in clean_txn.csv
    And the data in test_global_prediction.csv
    
Scenario: Customer finds the suggested service on 3rd August 2022 at Kovan Branch, using Android
    Given the date and time is "2022, 8, 3, 0, 0, 0"
    And I am using "Android"
    When I visit "/services?branch=Kovan"
    Then I should see the headers "Update Particulars, Update Phone, Current/Savings Account"
     And I should not see the headers "Closure Advice Withdrawal, Debit Card Update"

Scenario: Customer clicks at a suggested service on 3rd August 2022, using web
    Given the date and time is "2022, 8, 3, 0, 0, 0"
    And I am using "web"
    When I visit "/services?branch=Global"
    Then I should see the headers "Update Particulars, Current/Savings Account, Update Phone, Debit Card Replacement, Debit Card Issuance"
    When I click on the "service" of "Update Particulars"
    Then I should see the headers "Update Particulars, Get it done with Digibank in, Wait in the Queue"

# show default 5 services during unforcasted dates (current db is forecasted until 1 September 2022)
Scenario: Suggested service database has not been forecasted for the particular date
    Given the date and time is "2024, 2, 28, 0, 0, 0"
    And I am using "web"
    And I visit "/services"
    Then I should see the headers "Update Particulars, Update Phone, Funds Transfer, Debit Card Issuance, Debit Card Replacement"

