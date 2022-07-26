Feature: Display information about services

As a DBS Customer
I want to to know what does each services does
So that I know which service to navigate


Background: Services have been added to database
    Given the data in "sub.csv"
    Given I am using web
    
Scenario: Customer looks at Personal Info Update
    Given I visit "/services"
    When I click on the "category" of "Personal Info Update"
    Then I should see the headers "Keep your mobile number updated and ensure your transaction alerts on digibank app and mobile device are turned on, so you are notified of your account activities."

