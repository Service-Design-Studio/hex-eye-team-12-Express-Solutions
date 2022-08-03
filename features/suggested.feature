Feature: Display suggested services

As a DBS Customer
I want to have the most time-relevant service recommended to me
So that I can quickly deep link into the service.

Background: Services have been added to database

    Given the data in clean_txn.csv
    And the data in test_global_prediction.csv
    And I am using web

Scenario: Customer looks at the suggested service on 3rd August 2022 on his desktop
    Given the date and time is "2022, 8, 3, 0, 0, 0"
    And I visit "/services?branch=Global"
    Then I should see the headers "Update Particulars, Current/Savings Account, Update Phone, Account Closure, Debit Card Issuance"


Scenario: Customer looks at the suggested service on 3rd August 2022 at Kovan Branch
    Given the date and time is "2022, 8, 3, 0, 0, 0"
    And I visit "/services?branch=Kovan"
    Then I should see the headers "Account Closure, Debit Card Issuance, Update Particulars, Update Phone, Current/Savings Account"


# show default top 5 for unforcasted dates
Scenario: Customer looks at the suggested service on 28 February 2024
    Given the date and time is "2024, 2, 28, 0, 0, 0"
    And I visit "/services"
    Then I should see the headers "Update Particulars, Update Phone, Account Closure, Debit Card Issuance, Debit Card Replacement"
