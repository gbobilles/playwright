@ROAD-4466
Feature: [QAA-124] FTP User And Files - Sorting users by Oldest/Newest

    As a user, I should be able to sort FTP Users list in oldest/newest

    @QAA-124
    Scenario Outline: [QAA-124] Sort FTP Users list in oldest/newest
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."SFTPUSERS_LABEL" is displayed
        When I click "SFTPUserFiles"."SORT_BUTTON"
        And I click "SFTPUserFiles"."OLDEST_SORT_BUTTON"
        And I wait for FTP Users & Files Page to load
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        And I expect FTP User page rows are displayed in oldest order
        When I click "SFTPUserFiles"."SORT_BUTTON"
        And I click "SFTPUserFiles"."NEWEST_SORT_BUTTON"
        And I wait for FTP Users & Files Page to load
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        When I scroll to top of current page
        Then I expect FTP User page rows are displayed in newest order

        Examples:
            | username |
            | qaaaut4  |