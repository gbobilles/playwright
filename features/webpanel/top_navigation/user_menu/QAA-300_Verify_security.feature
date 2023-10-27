@ROAD-4472
Feature: [QAA-300] Top Navigation User - Verify Security Page

    As a user, I should be able to verify the Security Page via User Profile Modal

    @QAA-300
    Scenario Outline: [QAA-300] Verify Security Page
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
        When I click "UserModal"."SECURITY_LINK"
        Then I expect page to have url containing "?tree=billing.secure"
            And I expect element "Security"."CHANGE_PASSWORD_LABEL" is displayed
            And I expect element "Security"."MFA_LABEL" is displayed
            And I expect element "Security"."CHANGE_SECRET_QUESTION_ANSWER_LABEL" is displayed
            And I expect element "Security"."IP_LOCKING_LABEL" is displayed
            And I expect element "Security"."ACTIVE_SESSIONS_LABEL" is displayed

        Examples:
        | username | name           |
        | natman15 | Nat Manlangit  |