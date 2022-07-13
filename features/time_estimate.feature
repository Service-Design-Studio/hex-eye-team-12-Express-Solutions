Feature: Display and compare time-estimate for the digital and branch services.

As a DBS Customer
I want to to know how long it takes to complete a banking service;
So that I can save time to do other things


Background: Categories have been added to database
    Given the following categories exist:
    | category	            | category_int   	            | service	        | migratable	| count	        | details                                   | digital_time  | branch_time |
    | Accounts	            | CASA OPENING ADDON PAYROLL	| Account Opening	| TRUE	        | 50	        | CASA Payroll Add-on Account Opening	    | 11            | 22          |
    | Cash	                | CASH DEPOSIT	                | Deposit	        | FALSE	        | 10000	        | Deposit cash into CASA / SGD$ FD accts	| 1             | 2           |
    | Personal Info Update	| UPDATE CUSTOMER PHONE         | Update Phone	    | TRUE	        | 10000	        | Update Customer Phone	                    | 3	            | 5           |


    Then "3" seed services should exist
    Given I am using web
    
Scenario: Customer checks a migratable service
    Given I visit "/services"
    When I click on the "service" of "Update Phone"
    Then I should see the headers "Do it digitally, Do it at a branch"

Scenario: Customer checks the non-migratable service
    Given I visit "/services"
    When I click on the "service" of "Deposit"
    Then I should see the headers "Do it at a branch"
    And I should not see the headers "Do it digitally"