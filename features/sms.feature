Feature: Queue Number via SMS QR Code

#Autofill information about customer journey and redirect to default SMS app, to get a Queue number

As a DBS Customer;
I want to communicate my service needs to the branch as simply as possible. (less than 3 clicks);
So that I can get my queue number for the service I need.

Background: Categories have been added to database
    Given the following categories exist:
    | category	            | category_int   	            | service	        | migratable	| count	        | details                                   | digital_time  | branch_time |
    | Accounts	            | CASA OPENING ADDON PAYROLL	| Account Opening	| TRUE	        | 50	        | CASA Payroll Add-on Account Opening	    | 11            | 22          |
    | Cash	                | CASH DEPOSIT	                | Deposit	        | FALSE	        | 10000	        | Deposit cash into CASA / SGD$ FD accts	| 1             | 2           |
    | Personal Info Update	| UPDATE CUSTOMER PHONE         | Update Phone	    | TRUE	        | 10000	        | Update Customer Phone	                    | 3	            | 5           |

    Then "3" seed services should exist

    Given the following branches exist:
    | bank  | branch_name          | branch        | sms_number |
    | DBS   | MBFC Branch          | MBFC          | 83184335   |
    | POSB  | Bedok Central Branch | BedokCentral  | 83184358   |
    | POSB  | Tiong Bahru Branch   | TiongBahru    | 83184382   |

    Then "3" seed branches should exist

# Testing different browser detection, changing to compatible QR
Scenario: Customer using Web, at MBFC Branch, clicks on Update Phone
    Given I am using "web"
    When I visit "/services"
    And I click on the "service" of "Update Phone"
    And I select "MBFC Branch" 
    And I click on the "Next" button
    Then I should see the headers "Update Phone, MBFC Branch, Scan QR Code"
    And I should see a QR with "sms:+6583184335?&body=Q Update Phone"

Scenario: Customer using Android, at Bedok Central Branch, clicks on Account Opening
    Given I am using "Android"
    When I visit "/services"
    And I click on the "service" of "Account Opening"
    And I select "Bedok Central Branch"
    And I click on the "Next" button
    Then I should see the headers "Account Opening, Bedok Central Branch, Tap QR Code"
    And I should see a QR with "sms:+6583184358?&body=Q Account Opening"

Scenario: Customer using iPhone, at Tiong Bahru Branch, clicks on Cash Deposit
    Given I am using "iPhone"
    When I visit "/services"
    And I click on the "service" of "Deposit"
    And I select "Tiong Bahru Branch"
    And I click on the "Next" button
    Then I should see the headers "Deposit, Tiong Bahru Branch, Tap QR Code"
    And I should see a QR with "sms:/+6583184382/&body=Q Deposit"