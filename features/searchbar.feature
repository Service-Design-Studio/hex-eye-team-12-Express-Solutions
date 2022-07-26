Feature: Search Bar for finding services

As a DBS Customer;
I want to be able to find the service I want;
So that I can save time and energy from scouring the web.

Background: Services have been added to database
    Given the following services exist:
    | category	            | service_id    	            | service	          | migratable	    | count	        | details                                   | digital_time  | branch_time |
    | Personal Info Update	| UPDATE CUSTOMER ADDRESS       | Update Address      | TRUE	        | 2500	        | Update Customer Address	                | 3	            | 5           |
    | Personal Info Update	| UPDATE CUSTOMER EMAIL         | Update Email	      | TRUE	        | 7500	        | Update Customer Email	                    | 3	            | 5           |
    | Personal Info Update	| UPDATE CUSTOMER PARTICULARS   | Update Particulars  | TRUE	        | 20000	        | Update Customer Particulars               | 3	            | 5           |
    | Personal Info Update	| UPDATE CUSTOMER PHONE         | Update Phone	      | TRUE	        | 10000	        | Update Customer Phone	                    | 3	            | 5           |

    Then "4" seed services should exist

    Given I am using web

Scenario: Customer keys in matching search terms (autocomplete)
Given I visit "/services"
When I type in "Update" into the search bar
Then I should see the related services options on search bar containing the words "Update"
And I click on the "Update Phone" on the dropdown
Then I should see the headers "Update Phone, Do it digitally, Do it at a branch"

Scenario: Customer keys in non-matching search terms (ML)
Given I visit "/services"
When he types in "change" into the search bar
But he does not see the related services options on search bar containing the words "change"
Then after some time, he sees options containing the word "Update" on the dropdown
And I click on the "Update Phone" on the dropdown
Then I should see the headers "Update Phone, Do it digitally, Do it at a branch"

Scenario: Customer selects wrong service and returns to main page
Given I visit "/services"
When he types in "Update" into the search bar
And I click on the "Update Address" on the dropdown
When he press the back button
Then he will see his previous search terms "change" in the search bar
