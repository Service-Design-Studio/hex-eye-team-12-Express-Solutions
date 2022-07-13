Feature: More Page 

As a DBS Customer
I want to be able to queue
So that that I can get a branch service

Background: Topics have been added to database
    Given the following topics exist:
    | topic                 | 
    | Account Related       |
    | Cash Related          |
    | Non-Cash Related      |
    | Others                |

    Then "4" seed topics should exist


    Given the following branches exist:
    | bank | branch_name   | branch | sms_number |
    | DBS  | Branch name   | Branchname | 999 |
    | DBS  | MBFC Branch | MBFC  | 83184335 |
    | POSB  | Bedok Central Branch | BedokCentral  | 83184358 |
    Then "3" seed branches should exist


# Android

Scenario: I am not in any branch and I want to get cash related service
    Given I am using "Android"
    And I visit "/services"
    When I click on the "button" of "More"
    Then I should see "Branch name" pre-selected for branch
    When I select "Cash Related" 
    And I select "MBFC Branch"
    And I click on the "Get Queue Number" button
    Then I should see the headers "MBFC Branch, Cash Related, Tap QR Code"

Scenario: I am in MBFC Branch and I want to get cash related service
    Given I am using "Android"
    And I visit "/services?branch=MBFC"
    When I click on the "button" of "More"
    Then I should see "MBFC Branch" pre-selected for branch
    When I select "Cash Related" 
    And I click on the "Get Queue Number" button
    Then I should see the headers "MBFC Branch, Cash Related, Tap QR Code"




# iPhone
# Web