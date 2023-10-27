@ROAD-4451 @account-statuses
Feature: [QAA-532] [Account Types] - Login with a Suspended account

    As a user, I should be limited to what I can access when I used a Suspended Account

    @QAA-532
    Scenario Outline: [QAA-532] Verify Menu and links accessibility with a Suspended Account

        Given I navigate to DHWEBPANEL
        And I login with username "<username>"

        Then I expect text "wdio:div*=Account Suspended" is displayed
        And I expect text "wdio:p*=Bill payment is outstanding and this account has been suspended." is displayed
        And I expect element "Header"."PAY_BILL_NOW" is clickable

        # Verify links are active/inactive
        Then I expect element "LeftNavPanel"."HOME_LINK" is clickable
        * I expect element "LeftNavPanel"."WEBSITES_LINK" is clickable
        * I expect element "LeftNavPanel"."DOMAIN_NAMES_LINK" is not clickable
        * I expect element "LeftNavPanel"."WORDPRESS_LINK" is clickable
        * I expect element "LeftNavPanel"."MAIL_LINK" is not clickable
        * I expect element "LeftNavPanel"."PRO_SERVICES_LINK" is clickable
        * I expect element "LeftNavPanel"."BILLING_ACCOUNT_LINK" is clickable
        * I expect element "LeftNavPanel"."SUPPORT_LINK" is clickable
        * I expect element "LeftNavPanel"."MORE_LINK" is not clickable


        # Verify add product links are not visible
        Then I expect element "LeftNavPanel"."ADD_DREAMSHIELD_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_SHARED_HOSTING_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_MANAGED_WORDPRESS_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_DEDICATED_SERVER_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_CLOUD_SERVER_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_VPS_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_GOOGLE_WORKSPACE_LINK" is not displayed
        * I expect element "LeftNavPanel"."ADD_SEO_TOOLKIT_LINK" is not displayed

        # Verify Billing & Account menu
        When I click "LeftNavPanel"."BILLING_ACCOUNT_LINK"
        Then I expect element "LeftNavPanel"."MANAGE_ACCOUNT_LINK" is clickable
        And I expect element "LeftNavPanel"."MANAGE_PAYMENTS_LINK" is clickable
        And I expect element "LeftNavPanel"."VIEW_INVOICE_LINK" is clickable

        # Verify Support Menu links
        When I click "LeftNavPanel"."SUPPORT_LINK"
        Then I expect element "LeftNavPanel"."CONTACT_SUPPORT_LINK" is clickable
        * I expect element "LeftNavPanel"."SUPPORT_HISTORY_LINK" is clickable
        * I expect element "LeftNavPanel"."KNOWLEDGE_BASE_LINK" is clickable
        * I expect element "LeftNavPanel"."SYSTEM_STATUS_LINK" is clickable
        * I expect element "LeftNavPanel"."DATA_CENTERS_LINK" is clickable

        Examples:
            | username |
            | qaates3  |