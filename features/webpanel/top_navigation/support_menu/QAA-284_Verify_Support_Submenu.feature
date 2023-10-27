@ROAD-4471
Feature: [QAA-284] Top Navigation Support - Access Support Sub Menu links

    As a user, I should be able to access all links from Top-Navigation Support Menu

    @QAA-284
    Scenario Outline: [QAA-284] Verify Support Submenu links to be accessible
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
        When I click "Header"."SUPPORT_BUTTON"
        Then I expect page to have url containing "tree=home.over#!/welcome/"
            And I expect Top Nav Support Menu contains the following names and links
        | name              | link                                                      |                 
        | Contact Support   | ?tree=support.msg                                         |
        | Support History   | ?tree=support.msg&current_step=Index&next_step=History    |
        | Knowledge Base    | http://help.dreamhost.com                                |
        | System Status     | https://www.dreamhoststatus.com                           |
        | Data Centers      | ?tree=support.dc                                          |
        
    
        Examples:
        | username |
        | natman15 |