@ROAD-4466
Feature: [QAA-359] FTP User And Files - Filter Users by SFTP type for account with Shared Hosting only

    As a user, I should be able to filter by SFTP for accounts with Shared hosting only

    @QAA-359
    Scenario Outline: [QAA-359] Filter Users by SFTP type
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        When I wait for FTP Users & Files Page to load
        Then I expect element "SFTPUserFiles"."SFTPUSERS_LABEL" is displayed
        And I expect page to have url containing "index.cgi?tree=users.dashboard#"
        When I click "SFTPUserFiles"."FILTER_BUTTON"
        Then I expect element "SFTPUserFiles"."FILTER_MODAL" is displayed
        And I expect element "SFTPUserFiles"."DOMAINS_FILTER_TAB" is displayed
        And I expect element "SFTPUserFiles"."SERVERS_FILTER_TAB" is displayed
        And I expect element "SFTPUserFiles"."TYPE_FILTER_TAB" is displayed
        When I click "SFTPUserFiles"."TYPE_FILTER_TAB"
        Then I expect element "SFTPUserFiles"."SFTP_TYPE_CHECKBOX" is displayed
        When I click "SFTPUserFiles"."SFTP_TYPE_CHECKBOX"
        And I wait for FTP Users & Files Page to load
        Then I expect FTP Users Files filter type "SFTP" is checked
        And I verify FTP User files filter list contains "SFTP"

        Examples:
            | username |
            | natman15 |