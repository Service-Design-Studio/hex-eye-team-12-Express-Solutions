Feature: Queue Number via SMS QR Code

As a DBS Customer
I want to communicate my service needs to the branch as simply as possible. (less than 3 clicks)
So that I can get my queue number for the service I need

Background: Categories have been added to database

    Given the following branches exist:
    | bank  | branch_name          | branch        | sms_number | wait_time |
    | DBS   | MBFC Branch          | MBFC          | 83184335   | 5         |
    | POSB  | Bedok Central Branch | BedokCentral  | 83184358   | 3         |
    | POSB  | Tiong Bahru Branch   | TiongBahru    | 83184382   | 4         |

    Then "3" seed branches should exist

    Given the date and time is "2022, 8, 3, 0, 0, 0"
    And the data in test_global_prediction.csv
    And the data in clean_txn.csv

#Testing different browser detection, changing to compatible QR
Scenario: Customer using Web, at MBFC Branch, clicks on Update Phone
    Given I am using "web"
    When I visit "/services"
    And I click on the "service" of "Update Phone"
    And I select "MBFC Branch" 
    And I click on the "Get Queue Number" button
    Then I should see the headers "Update Phone, MBFC Branch, Scan QR Code"
    And I should see a QR with "sms:+6583184335?&body=Q Update Phone"

Scenario: Customer using Android, at Bedok Central Branch, clicks on Update Particulars
    Given I am using "Android"
    When I visit "/services?branch=BedokCentral"
    And I click on the "service" of "Update Particulars"
    And I select "Bedok Central Branch"
    And I click on the "Get Queue Number" button
    Then I should see the headers "Update Particulars, Bedok Central Branch, Tap QR Code"
    And I should see a QR with "sms:+6583184358?&body=Q Update Particulars"

Scenario: Customer using iPhone, at Tiong Bahru Branch, clicks on Cash Deposit
    Given I am using "iPhone"
    When I visit "/services?branch=TiongBahru"
    And I click on the "service" of "ATM Card Replacement"
    And I select "Tiong Bahru Branch"
    And I click on the "Get Queue Number" button
    Then I should see the headers "ATM Card Replacement, Tiong Bahru Branch, Tap QR Code"
    And I should see a QR with "sms:/+6583184382/&body=Q ATM Card Replacement"