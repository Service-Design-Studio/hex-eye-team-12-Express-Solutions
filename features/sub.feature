Feature: Display information about services

As a DBS Customer;
I want to know about the details of the service;
So that I know which service is for me.

Background: Services have been added to database

    Given the data in sub.csv
    And the data in test_global_prediction.csv
    And I am using web
    
Scenario: Customer looks at the Personal Info Update category
    Given I visit "/services"
    When I click on the "category" of "Personal Info Update"
    Then I should see the headers "Keep your mobile number updated and ensure your transaction alerts on digibank app and mobile device are turned on, so you are notified of your account activities."

