@ROAD-4466
Feature: [QAA-67] FTP User And Files - Disable SSH Access

    As a user, I should be able to disable SSH access of any FTP User

    @QAA-67
    Scenario Outline: [QAA-67] Disable SSH Access
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        When I search for text "<ftp_user>" in FTP Users Page
        And I disable SSH for FTP User
        Then I expect element "SFTPUserFiles"."SSH_DISABLE_BUTTON" is displayed

        Examples:
            | username | ftp_user  |
            | qaaaut6  | qaa_67_01 |