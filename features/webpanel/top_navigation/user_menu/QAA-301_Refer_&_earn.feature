@ROAD-4472
Feature: [QAA-301] Top Navigation User - Verify Refer & Earn Page

    As a user, I should be able to verify the Refer & Earn Page via User Profile Modal

    @QAA-301
    Scenario Outline: [QAA-301] Verify Refer & Earn Page
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
        When I click "UserModal"."REFERRAL_LINK"
        Then I expect page to have url containing "?tree=referrals.dashboard"
            And I expect element "Referral"."PARTNER_PROGRAM_LABEL" is displayed
            And I expect element "Referral"."SIGNUP_TODAY_BUTTON" is clickable
            And I expect element "Referral"."LEARN_MORE_BUTTON" is clickable
            And I expect element "Referral"."CONTACT_AFFILIATE_TEAM_BUTTON" is clickable
        
        Examples:
        | username | name           |
        | natman15 | Nat Manlangit  |