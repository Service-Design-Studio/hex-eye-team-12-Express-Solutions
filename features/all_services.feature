Feature: Customer is looking for his service on the main page

As a DBS Customer
I want to be able to find the service without hassle
So that my banking needs can be fulfilled in a timely manner

Background: Categories have been added to database
    Given the following categories exist:
    | category        | category_int       | service       | migratable | count |
    | Account Opening | CASA OPENING ADDON | Opening Addon | True       | 50    |
    | Cash            | CASH DEPOSIT       | Cash Deposit  | False      | 10000 |
    

  Then 2 seed services should exist


Scenario: Customer clicks on Account Opening Category
    Given I am on the home page for "services"
    When I click on the "Cash"
    Then I should see 1 services on "Cash"