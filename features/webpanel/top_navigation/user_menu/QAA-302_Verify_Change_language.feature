@ROAD-4472
Feature: [QAA-302] Top Navigation User - Verify Change Language Page

    As a user, I should be able to verify the Change Language Page via User Profile Modal

    @QAA-302
    Scenario Outline: [QAA-302] Verify Change Language Page
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
        When I click "UserModal"."SWITCH_LANGUAGE_SECTION"
        Then I expect element "UserModal"."ENGLISH_OPTION" contains text "English"
        Then I expect element "UserModal"."SPANISH_OPTION" contains text "Español"

        
        Examples:
        | username | name           |
        | natman15 | Nat Manlangit  |