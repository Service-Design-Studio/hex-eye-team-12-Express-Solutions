Feature: Display & Navigation for all Banking Services

As a DBS Customer
I want to be able to find the service without hassle
So that my banking needs can be fulfilled in a timely manner

Background: Categories have been added to database
    Given the following services exist:
    | category                  | service_id                | service                   | migratable    | count     |
    | Account Opening           | CASA OPENING ADDON        | Opening Addon             | True          | 50        |
    | Cash                      | CASH DEPOSIT              | Cash Deposit              | False         | 10000     |
    | Personal Info Update      | UPDATE CUSTOMER PHONE     | Update Phone              | True          | 10000     |

    Then "3" seed services should exist
    
    Given the following branches exist:
    | bank | branch_name   | branch | sms_number |
    | DBS  | MBFC Branch   | MBFC  | 83184335 |
    | POSB | Bedok Central Branch | BedokCentral  | 83184358 |
    Then "2" seed branches should exist

    Given I am using web

Scenario: Customer uses a web link to access the One-Stop Service page 
    When I visit "/services"
    Then I should see the headers "Are you looking for these?, Categories"

#Dynamic Branch Naming

Scenario: Customer goes to MBFC branch and scans QR Code
    When I visit "/services?branch=MBFC"
    Then I should see the headers "MBFC"

Scenario: Customer tries a random url of our web service #sad path
    When I visit "/randomsite"
    Then I should see the headers "Are you looking for these?"
    Then I should not see the headers "randomsite"

#----------------------------------------------------------------------------------------------------

Scenario: Customer can't find his service on Main Page #sad path
    When I visit "/services"
    Then I click on the "button" of "More"
    Then I should see the headers "More"

