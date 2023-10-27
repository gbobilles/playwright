@ROAD-4466
Feature: [QAA-123] FTP User And Files - Copy Feature

    As a user, I should be able to search for FTP users using the search textfield

    @QAA-123
    Scenario: [QAA-123] Hostname clipboard is copied correctly
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."SEARCH_TEXTFIELD" is displayed
        When I select Login Info of first FTP User
        And I click copy to clipboard of host_name from FTP Users Page
        Then I expect host_name clipboard value was copied correctly
        When I click copy to clipboard of user_name from FTP Users Page
        Then I expect user_name clipboard value was copied correctly
        When I click copy to clipboard of port_name from FTP Users Page
        Then I expect port_name clipboard value was copied correctly

        Examples:
            | username |
            | natman15 |