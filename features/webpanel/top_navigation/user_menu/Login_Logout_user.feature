@ROAD-4472
Feature: [QAA-545] Top Navigation User - User able to Logout successfully.

    As a user, I should be able to verify the user able to logout successfully.

    @QAA-545
    Scenario Outline: [QAA-545] Verify user able to logout successfully. 
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        Then I expect page to have url containing "?tree=home.over#!/welcome/"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
            And I expect element "UserModal"."EMAIL_ADDRESS_LABEL" contains text "<email>"
        When I click "UserModal"."LOGOUT_LINK"
        Then I expect page to have url containing "?Nscmd=Nlogout"

        Examples:
            | username | name           | account_name  | email |
            | anntar5 | Anna Mae Tariman  | Anna Mae's Account | annamae.tariman+test0606@dreamhost.com |