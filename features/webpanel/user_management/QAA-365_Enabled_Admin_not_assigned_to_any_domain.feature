@ROAD-4466
Feature: [QAA-365] FTP User And Files - Enable Admin Privileges for User with no domain

    As a user, I should be able to enable admin access to an FTP account with no domain attached

    @QAA-365
    Scenario Outline: [QAA-365] Enable Admin capability to FTP user with no domain
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        When I wait for FTP Users & Files Page to load
        Then I expect element "SFTPUserFiles"."SFTPUSERS_LABEL" is displayed
        And I expect page to have url containing "index.cgi?tree=users.dashboard#"
        When I search for text "<ftp_user>" in FTP Users Page
        And I enable Admin for FTP User
        Then I expect admin user toggle is enabled

        Examples:
            | username | ftp_user  |
            | aljsal1  | dh_m6t55g |