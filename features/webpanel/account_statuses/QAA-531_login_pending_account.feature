@ROAD-4451 @account-statuses
Feature: [QAA-531] [Account Types] - Login with a pending account

    As a user, I should be limited to what I can access when I used a Pending Account

    @QAA-531
    Scenario Outline: [QAA-531] Verify Menu and links accessibility with a Pending Account

        Given I navigate to DHWEBPANEL
        And I login with username "<username>"

        Then I expect text "Account Pending" is displayed
        And I expect text "The DreamHost account approvals team is still in the process of setting up your account and will get back to you shortly with all the sweet details once they're finished!" is displayed

        # Verify links are active/inactive
        * I expect element "LeftNavPanel"."HOME_LINK" is clickable
        * I expect element "LeftNavPanel"."WEBSITES_LINK" is not clickable
        * I expect element "LeftNavPanel"."DOMAIN_NAMES_LINK" is not clickable
        * I expect element "LeftNavPanel"."WORDPRESS_LINK" is not clickable
        * I expect element "LeftNavPanel"."MAIL_LINK" is not clickable
        * I expect element "LeftNavPanel"."PRO_SERVICES_LINK" is not clickable
        * I expect element "LeftNavPanel"."BILLING_ACCOUNT_LINK" is clickable
        * I expect element "LeftNavPanel"."SUPPORT_LINK" is clickable
        * I expect element "LeftNavPanel"."MORE_LINK" is not clickable

        # Verify Billing & Account menu
        When I click "LeftNavPanel"."BILLING_ACCOUNT_LINK"
        Then I expect element "LeftNavPanel"."MANAGE_ACCOUNT_LINK" is clickable
        And I expect element "LeftNavPanel"."MANAGE_PAYMENTS_LINK" is clickable
        And I expect element "LeftNavPanel"."VIEW_INVOICE_LINK" is clickable

        # Verify Manage Account
        When I click "LeftNavPanel"."MANAGE_ACCOUNT_LINK"
        Then I expect text "wdio:div=Account Pending" is displayed
        And I expect text "The DreamHost account approvals team is still in the process of setting up your account and will get back to you shortly with all the sweet details once they're finished!" is displayed
        And I expect text "wdio:p=Account approval pending. Some information on this page may be inaccurate or unavailable. Please check back later or contact support for assistance." is displayed

        # Verify Support Menu links
        When I click "LeftNavPanel"."SUPPORT_LINK"
        Then I expect element "LeftNavPanel"."CONTACT_SUPPORT_LINK" is not clickable
        * I expect element "LeftNavPanel"."SUPPORT_HISTORY_LINK" is not clickable
        * I expect element "LeftNavPanel"."KNOWLEDGE_BASE_LINK" is not clickable
        * I expect element "LeftNavPanel"."SYSTEM_STATUS_LINK" is not clickable
        * I expect element "LeftNavPanel"."DATA_CENTERS_LINK" is not clickable

        Examples:
            | username |
            | qaates2  |