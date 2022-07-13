Feature: Display & Navigation for all Banking Services

As a DBS Customer
I want to be able to find the service without hassle
So that my banking needs can be fulfilled in a timely manner

Background: Categories have been added to database
    Given the following categories exist:
    | category                  | category_int              | service                   | migratable    | count     |
    | Account Opening           | CASA OPENING ADDON        | Opening Addon             | True          | 50        |
    | Cash                      | CASH DEPOSIT              | Cash Deposit              | False         | 10000     |
    | Personal Info Update      | UPDATE CUSTOMER PHONE     | Update Customer Phone     | True          | 10000     |

    Then "3" seed services should exist
    Given the following branches exist:
    | bank | branch_name   | branch | sms_number |
    | DBS  | MBFC Branch | MBFC  | 83184335 |
    | POSB  | Bedok Central Branch | BedokCentral  | 83184358 |
    Then "2" seed branches should exist


Scenario: Customer using Web, at MBFC Branch, clicks on /services/39/show_QR
    Given I am using web
    When I visit "/services"
    And I click on the "service" of "Update Customer Phone"
    And I select MBFC Branch 
    Then I should see the headers "friend"

Scenario: Customer using Android, at MBFC Branch, clicks on /services/39/show_QR
    Given I am using Android
    When I visit "/services"
    And I click on the "service" of "Update Customer Phone"
    And I select MBFC Branch 
    Then I should see the headers "friend"

Scenario: Customer using iPhone, at MBFC Branch, clicks on /services/39/show_QR
    Given I am using iPhone
    When I visit "/services"
    And I click on the "service" of "Update Customer Phone"
    And I select MBFC Branch 
    Then I should see the headers "friend"