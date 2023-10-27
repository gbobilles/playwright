@ROAD-4451 @account-statuses
Feature: [QAA-530] [Account Types] - Login with a closed account

    As a user, I should be limited to what I can access when I used a Closed Account

    @QAA-530
    Scenario Outline: [QAA-530] Verify Menu and links accessibility with a Closed Account

        Given I navigate to DHWEBPANEL
        And I login with username "<username>"

        Then I expect text "At one point, you had hosting with us. We'd love to be your host again." is displayed

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
        Then I expect text "wdio:div=Account Closed" is displayed
        And I expect text "wdio:p*=This account is currently closed, but you can add a hosting plan to re-open it! Add a Hosting Plan" is displayed

        # Verify Support Menu links
        When I click "LeftNavPanel"."SUPPORT_LINK"
        Then I expect element "LeftNavPanel"."CONTACT_SUPPORT_LINK" is clickable
        * I expect element "LeftNavPanel"."SUPPORT_HISTORY_LINK" is not clickable
        * I expect element "LeftNavPanel"."KNOWLEDGE_BASE_LINK" is clickable
        * I expect element "LeftNavPanel"."SYSTEM_STATUS_LINK" is not clickable
        * I expect element "LeftNavPanel"."DATA_CENTERS_LINK" is not clickable

        Examples:
            | username |
            | qaates1  |