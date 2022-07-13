Feature: Display & Navigation for all Banking Services

As a DBS Customer
I want to be able to find the service without hassle
So that my banking needs can be fulfilled in a timely manner

Background: Categories have been added to database
    Given the following categories exist:
    | category                  | category_int              | service                   | migratable    | count     |
    | Account Opening           | CASA OPENING ADDON        | Opening Addon             | True          | 50        |
    | Cash                      | CASH DEPOSIT              | Cash Deposit              | False         | 10000     |
    | Personal Info Update      | UPDATE CUSTOMER PHONE     | Update Phone              | True          | 10000     |

    Then "3" seed services should exist


Scenario: Customer uses a QR Code link to access the One-Stop Service page 
    When I visit "/services"
    Then I should see the headers "Top Services, Main Categories"

#Dynamic Branch Naming

Scenario: Customer goes to Eunos branch and scans QR Code
    When I visit "/services?branch=Eunos"
    Then I should see the headers "Eunos"

Scenario: Customer tries to random url of our web service #sad path
    When I visit "/randomsite"
    Then I should see the headers "One-Stop Solutions, What are you looking for?"
    Then I should not see the headers "Mars"

#----------------------------------------------------------------------------------------------------

Scenario: Customer can't find his service on Main Page #sad path
    When I visit "/services"
    Then I click on the "button" of "More"
    Then I should see the headers "More, Get Queue Number"

