@ROAD-4466
Feature: [QAA-358] FTP User And Files - Filter Users by FTP type for account with Shared Hosting only

    As a user, I should be able to filter by FTP for accounts with Shared hosting only

    @QAA-358 @XPROD-236
    Scenario Outline: [QAA-358] Filter Users by FTP type
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I switch to webid "<webid>"
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
        Then I expect element "SFTPUserFiles"."FTP_TYPE_CHECKBOX" is displayed
        When I click "SFTPUserFiles"."FTP_TYPE_CHECKBOX"
        And I wait for FTP Users & Files Page to load
        Then I expect FTP Users Files filter type "FTP" is checked
        And I verify FTP User files filter list contains "FTP"

        Examples:
            | username | webid  |
            | natman14 | chamcd |