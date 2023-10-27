@ROAD-4472
Feature: [QAA-297] Top Navigation User - Verify the Sub-menus

    As a user, I should be able to verify the submenus from Top Navigation - User Profile section

    @QAA-297
    Scenario Outline: [QAA-297] Verify User Profile Submenu
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
            And I expect User Modal displays the following submenu links
            | label             | link                      |
            | Profile & Privacy | ?tree=billing.contact     |
            | Billing & Payment | ?tree=billing.account     |
            | Security          | ?tree=billing.secure      | 
            | Refer & Earn      | ?tree=referrals.dashboard |
            And I expect element "UserModal"."SWITCH_LANGUAGE_SECTION" is displayed
            And I expect element "UserModal"."ADMIN_SECTION" is displayed
            And I expect element "UserModal"."SWITCH_TO_USER_TEXTINPUT" is enabled
            And I expect element "UserModal"."USER_EMAIL_SECTION" is displayed
        When I switch to different webid "<webid>"
            And I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."USER_EMAIL_SECTION" is not displayed

        Examples:
            | username | name           | webid     |
            | natman14 | Nat Manlangit  | natman15  |