Feature: More Page 

As a DBS Customer
I want to be able to queue
So that that I can get a branch service

Background: Branches, Services, Topics have been added to database
    Given the following topics exist:
    | topic                 | 
    | Account Related       |
    | Cash Related          |
    | Non-Cash Related      |
    | Others                |

    Then "4" seed topics should exist

    Given the data in test_global_prediction.csv
    And the data in clean_txn.csv
    And the data in branch.csv
    And the data in test_global_prediction.csv
    
# not in branch, get QR from Android
Scenario: I am not in any branch and I want to get cash related service from Android
    Given I am using "Android"
    And I visit "/services"
    When I click on the "card" of "General Services"
    Then I should see "Ang Mo Kio Central Branch" pre-selected for branch
    When I select "Cash Related" 
    And I select "MBFC Branch"
    And I click on the "Next" button
    Then I should see the headers "MBFC Branch, Cash Related, Tap QR Code"
    And I should see a QR with "sms:+6583184335?&body=Q Cash Related"

# in MBFC branch, get QR from Android
Scenario: I am in MBFC Branch and I want to get cash related service from Android
    Given I am using "Android"
    And I visit "/services?branch=MBFC"
    When I click on the "card" of "General Services"
    Then I should see "MBFC Branch" pre-selected for branch
    When I select "Cash Related" 
    And I click on the "Next" button
    Then I should see the headers "MBFC Branch, Cash Related, Tap QR Code"
    And I should see a QR with "sms:+6583184335?&body=Q Cash Related"

# not in branch, get QR from iPhone
Scenario: I am not in any branch and I want to get cash related service from iPhone
    Given I am using "iPhone"
    And I visit "/services"
    When I click on the "card" of "General Services"
    Then I should see "Ang Mo Kio Central Branch" pre-selected for branch
    When I select "Cash Related" 
    And I select "MBFC Branch"
    And I click on the "Next" button
    Then I should see the headers "MBFC Branch, Cash Related, Tap QR Code"
    And I should see a QR with "sms:/+6583184335/&body=Q Cash Related"

# in MBFC branch, get QR from iPhone
Scenario: I am in MBFC Branch and I want to get cash related service from iPhone
    Given I am using "iPhone"
    And I visit "/services?branch=MBFC"
    When I click on the "card" of "General Services"
    Then I should see "MBFC Branch" pre-selected for branch
    When I select "Cash Related" 
    And I click on the "Next" button
    Then I should see the headers "MBFC Branch, Cash Related, Tap QR Code"
    And I should see a QR with "sms:/+6583184335/&body=Q Cash Related"

# not in branch, get QR from Desktop (Web)
Scenario: I am not in any branch and I want to get cash related service from web
    Given I am using web
    And I visit "/services"
    When I click on the "card" of "General Services"
    Then I should see "Ang Mo Kio Central Branch" pre-selected for branch
    When I select "Cash Related" 
    And I select "MBFC Branch"
    And I click on the "Next" button
    Then I should see the headers "MBFC Branch, Cash Related, Scan QR Code"
    And I should see a QR with "sms:+6583184335?&body=Q Cash Related"
