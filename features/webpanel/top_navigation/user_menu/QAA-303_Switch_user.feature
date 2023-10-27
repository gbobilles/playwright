@ROAD-4472
Feature: [QAA-303] Top Navigation User - Switching Users

    As a user, I should be able to switch users via User Profile Modal

    @QAA-303
    Scenario Outline: [QAA-303] Verify Switching User capability
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
        When I switch to different webid "natman14"
        Then I expect page to have url containing "?switch_to_user=<webid>&clear=1"
        When I click "Header"."PROFILEICON_BUTTON"
            And I switch to different webid "<username>"
        Then I expect page to have url containing "?switch_to_user=<username>&clear=1"

        
        Examples:
        | username | name           | webid     |
        | natman14 | Nat Manlangit  | natman15  |