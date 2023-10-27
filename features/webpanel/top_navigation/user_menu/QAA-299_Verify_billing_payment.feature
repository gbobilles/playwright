@ROAD-4472
Feature: [QAA-299] Top Navigation User - Verify Billing & Payment Page

    As a user, I should be able to verify the Billing & Payment Page via User Profile Modal

    @QAA-299
    Scenario Outline: [QAA-299] Verify Billing & Payment Page
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."PROFILEICON_BUTTON"
        Then I expect element "UserModal"."PROFILE_NAME_LABEL" contains text "<name>"
        When I click "UserModal"."BILLING_PAYMENT_LINK"
        Then I expect page to have url containing "?tree=billing.account"
            And I expect element "BillingPayment"."ACTIVE_PLANS_LABEL" is displayed
            And I expect element "BillingPayment"."ACCOUNT_NAME_LABEL" contains text "<account_name>"

        Examples:
        | username | name           | account_name  |
        | natman15 | Nat Manlangit  | Nat's Account |