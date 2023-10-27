@ROAD-4451 @account-statuses
Feature: [QAA-533] [Account Types] - Login with an Approved account

    As a user, I should be limited to what I can access when I used an Approved Account

    @QAA-533
    Scenario Outline: [QAA-533] Verify Menu and links accessibility with an Approved Account

        Given I navigate to DHWEBPANEL
        And I login with username "<username>"

        Then I expect text "wdio:h1*=Hi <account_name>! Welcome to the Control Panel." is displayed

        # Verify default menus are active
        * I expect element "LeftNavPanel"."HOME_LINK" is clickable
        * I expect element "LeftNavPanel"."WEBSITES_LINK" is clickable
        * I expect element "LeftNavPanel"."DOMAIN_NAMES_LINK" is clickable
        * I expect element "LeftNavPanel"."WORDPRESS_LINK" is clickable
        * I expect element "LeftNavPanel"."MAIL_LINK" is clickable
        * I expect element "LeftNavPanel"."PRO_SERVICES_LINK" is clickable
        * I expect element "LeftNavPanel"."BILLING_ACCOUNT_LINK" is clickable
        * I expect element "LeftNavPanel"."SUPPORT_LINK" is clickable
        * I expect element "LeftNavPanel"."MORE_LINK" is clickable
        * I expect element "LeftNavPanel"."MORE_LINK" is clickable

        # Verify add product links are active
        Then I expect element "LeftNavPanel"."ADD_DREAMSHIELD_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_SHARED_HOSTING_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_MANAGED_WORDPRESS_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_DEDICATED_SERVER_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_CLOUD_SERVER_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_VPS_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_GOOGLE_WORKSPACE_LINK" is clickable
        * I expect element "LeftNavPanel"."ADD_SEO_TOOLKIT_LINK" is clickable

        # Verify Billing & Account menu
        When I click "LeftNavPanel"."BILLING_ACCOUNT_LINK"
        Then I expect element "LeftNavPanel"."MANAGE_ACCOUNT_LINK" is clickable
        And I expect element "LeftNavPanel"."MANAGE_PAYMENTS_LINK" is clickable
        And I expect element "LeftNavPanel"."VIEW_INVOICE_LINK" is clickable

        # Verify Manage Account
        When I click "LeftNavPanel"."MANAGE_ACCOUNT_LINK"
        Then I expect text "<account_name>'s Account" is displayed
        And I expect text "ID# <account_id>" is displayed

        # Verify Support Menu links
        When I click "LeftNavPanel"."SUPPORT_LINK"
        Then I expect element "LeftNavPanel"."CONTACT_SUPPORT_LINK" is clickable
        * I expect element "LeftNavPanel"."SUPPORT_HISTORY_LINK" is clickable
        * I expect element "LeftNavPanel"."KNOWLEDGE_BASE_LINK" is clickable
        * I expect element "LeftNavPanel"."SYSTEM_STATUS_LINK" is clickable
        * I expect element "LeftNavPanel"."DATA_CENTERS_LINK" is clickable

        Examples:
            | username | account_name | account_id |
            | qaates4  | QAA533       | 2801151    |