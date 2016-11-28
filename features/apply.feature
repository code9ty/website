Feature: Interested user can apply for intake
    As an interested user
    I want to apply
    So that I can be considered for intake

    Background: the application process is open
      Given the application is open

    Scenario: Interested user applies
        Given I am an interested user
        When I visit application page
        And I fill in the required fields
        Then I should see "Your application has been received."

    Scenario: Interested user applies with wrong information
        Given I am an interested user
        When I visit application page
        And I fill in the wrong information
        Then I should see "You filled in something we didn't understand"

