@ROAD-4471
Feature: [QAA-281] Top Navigation Support - Submit a Ticket via Support Menu

    As a user, I should be able to submit a ticket by going to Contact Support page

    @QAA-281
    Scenario Outline: [QAA-281] Submit a Ticket
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."SUPPORT_BUTTON"
        Then I expect Top Nav Support Menu contains the following links
            | Contact Support   |
            | Support History   |
            | Knowledge Base    |
            | System Status     |
            | Data Centers      |
        When I click "Header"."CONTACT_SUPPORT_LINK"
        Then I expect element "ContactSupport"."CONTACT_SUPPORT_LABEL" is displayed
            And I expect page to have url containing "tree=support.msg"
        When I select a topic "<topic>" from Contact Support Page
            And I select a domain "<domain>" from Contact Support Page
            And I select a expertise "<expertise>" from Contact Support Page
            And I set "<subject>" to inputfield "ContactSupport"."SUBJECT_TEXTFIELD"
            And I set "<message>" to inputfield "ContactSupport"."MESSAGE_TEXTAREA"
        Then I expect element "ContactSupport"."SUBMIT_TICKET_BUTTON" is enabled
        #     And I click "ContactSupport"."SUBMIT_TICKET_BUTTON"
        # Then I expect text "Thanks for your message! We'll get back to you shortly." is displayed
    
        Examples:
            | username | topic      | domain            | expertise     | subject                  | message                | 
            | natman15 | DreamPress | nmmtest08.online  | experienced   | Automation Test Subject  | This is a test message |