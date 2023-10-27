@ROAD-4471
Feature: [QAA-283] Top Navigation Support - Support History

    As a user, I should be able to access my Support History Page

    @QAA-283
    Scenario Outline: [QAA-283] Access Support History
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."SUPPORT_BUTTON"
        Then I expect Top Nav Support Menu contains the following links
            | Contact Support   |
            | Support History   |
            | Knowledge Base    |
            | System Status     |
            | Data Centers      |
        When I click "Header"."SUPPORT_HISTORY_LINK"
        Then I expect page to have url containing "?tree=support.msg&current_step=Index&next_step=History"
            And I expect element "SupportHistory"."SUPPORT_HISTORY_LABEL" is displayed
            And I expect page to have url containing "<url_path>"
            And I expect element "SupportHistory"."EXPAND_ALL_BUTTON" is clickable
            And I expect element "SupportHistory"."SEARCH_MESSAGE_TEXTFIELD" is enabled

        Examples:
            | username | url_path                                                        |
            | natman15 | index.cgi?tree=support.msg&current_step=Index&next_step=History |