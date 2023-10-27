@ROAD-4471
Feature: [QAA-286] Top Navigation Support - Contact Support

    As a user, I should be able to access Contact Support page with no issues

    @QAA-286
    Scenario Outline: [QAA-286] Verify Support Submenu links to be accessible
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."SUPPORT_BUTTON"
            And I click "Header"."CONTACT_SUPPORT_LINK"
        Then I expect element "ContactSupport"."CONTACT_SUPPORT_LABEL" is displayed
            And I expect element "ContactSupport"."TOPIC_DROPDOWN" is enabled
            And I expect element "ContactSupport"."DOMAIN_DROPDOWN" is enabled
            And I expect element "ContactSupport"."EXPERTISE_DROPDOWN" is enabled
            And I expect element "ContactSupport"."SUBJECT_TEXTFIELD" is enabled
            And I expect element "ContactSupport"."MESSAGE_TEXTAREA" is enabled
            And I expect element "ContactSupport"."CONTACT_SUPPORT_TAB" is clickable
            And I expect element "ContactSupport"."KNOWLEDGE_BASE_TAB" is clickable
            And I expect page to have url containing "tree=support.msg"

        Examples:
        | username |
        | natman15 |