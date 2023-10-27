@ROAD-4466
Feature: [QAA-125] FTP User And Files - Filter function for users UI - Domains and Server mixed filters

    As a user, I should be able to filter FTP users list by domains and servers

    @QAA-125
    Scenario Outline: [QAA-125] Filter list by domains and servers
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        When I click "SFTPUserFiles"."FILTER_BUTTON"
        Then I expect element "SFTPUserFiles"."FILTER_MODAL" is displayed
        When I set domain filter to "<domain>" from FTP Users Page
        Then I expect applied domain filter "<domain>" is displayed in tags section
        When I set server filter to "<server>" from FTP Users Page
        Then I expect applied server filter "<server>" is displayed in tags section

        Examples:
            | username | domain           | server           |
            | natman15 | nmmtest02.online | Shared Unlimited |