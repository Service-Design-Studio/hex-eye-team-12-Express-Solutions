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
    | DBS  | MBFC Branch | MBFC  | 83184335 |
    | POSB  | Bedok Central Branch | BedokCentral  | 83184358 |
    Then "2" seed branches should exist



Scenario: I am in MBFC Branch and i want to get cash related service
    Given I am at "MBFC Branch"
    And I want to get a cash related service
    When I click on the "button" of "More"
    Then I should see "MBFC Branch" pre-selected for branch
    When I choose cash related topic
    And I click on "Get Queue Number" button
    Then I should see headers "MBFC Branch, Cash Related"

Scenario: I am not in any branch and i want to get cash related service
    Given I am at "no branch"
    And I want to get a cash related service
    When I click on the More button
    Then I should see "Ang Mo Kio Central Branch" pre-selected for branch
    When I choose cash related topic
    And I choose "MBFC Branch"
    And I click on "Get Queue Number" button
    Then I should see headers MBFC Branch and Cash Related
# _____________________________________________NEW_____________________
