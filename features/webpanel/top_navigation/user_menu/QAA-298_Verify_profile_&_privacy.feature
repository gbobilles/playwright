@ROAD-4472
Feature: [QAA-298] Top Navigation User - Verify the Profile & Privacy Page

    As a user, I should be able to verify the Profile & Privacy Page via User Profile Modal

    @QAA-298
    Scenario Outline: [QAA-298] Verify Profile & Privacy Page
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
        When I click "UserModal"."PROFILE_PRIVACY_LINK"
        Then I expect page to have url containing "?tree=billing.contact"
            And I expect element "ContactInformation"."CONTACT_INFORMATION_LABEL" is displayed
            And I expect element "ContactInformation"."EMAIL_COMM_PREFERENCE_LABEL" is displayed
            And I expect element "ContactInformation"."LANGUAGE_LABEL" is displayed

        Examples:
            | username | name           |
            | natman15 | Nat Manlangit  |