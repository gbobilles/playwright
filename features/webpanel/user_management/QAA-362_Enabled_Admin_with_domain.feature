@ROAD-4466
Feature: [QAA-362] FTP User And Files - Enable Admin Privileges for User with Domain

    As a user, I should not be able to see any option to enable admin access to any ftp accounts with domain attached

    @QAA-362
    Scenario Outline: [QAA-362] Verify Admin Toggle for User with Domain attached
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        When I wait for FTP Users & Files Page to load
        Then I expect element "SFTPUserFiles"."SFTPUSERS_LABEL" is displayed
        And I expect page to have url containing "index.cgi?tree=users.dashboard#"
        When I search for text "<ftp_user>" in FTP Users Page
        Then I expect element "SFTPUserFiles"."ADMIN_UNAVAILABLE_BUTTON" is displayed

        Examples:
            | username | ftp_user  |
            | aljsal1  | dh_3u33p7 |