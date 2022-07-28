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

    Given the following branches exist:
    | bank | branch_name           | branch        | sms_number |
    | DBS  | Branch name           | Branchname    | 999        |
    | DBS  | MBFC Branch           | MBFC          | 83184335   |
    | POSB | Bedok Central Branch  | BedokCentral  | 83184358   |

    Then "3" seed branches should exist

    Given the following services exist:
    | category	            | service_id   	                | service	        | migratable	| count	        | details                                   | digital_time  | branch_time |
    | Accounts	            | CASA OPENING ADDON PAYROLL	| Account Opening	| TRUE	        | 50	        | CASA Payroll Add-on Account Opening	    | 11            | 22          |
    | Cash	                | CASH DEPOSIT	                | Deposit	        | FALSE	        | 10000	        | Deposit cash into CASA / SGD$ FD accts	| 1             | 2           |
    | Personal Info Update	| UPDATE CUSTOMER PHONE         | Update Phone	    | TRUE	        | 10000	        | Update Customer Phone	                    | 3	            | 5           |

    Then "3" seed services should exist

# not in branch, get QR from Android
Scenario: I am not in any branch and I want to get cash related service from Android
    Given I am using "Android"
    And I visit "/services"
    When I click on the "card" of "General Services"
    Then I should see "Branch name" pre-selected for branch
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
    Then I should see "Branch name" pre-selected for branch
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
    Then I should see "Branch name" pre-selected for branch
    When I select "Cash Related" 
    And I select "MBFC Branch"
    And I click on the "Next" button
    Then I should see the headers "MBFC Branch, Cash Related, Scan QR Code"
    And I should see a QR with "sms:+6583184335?&body=Q Cash Related"
