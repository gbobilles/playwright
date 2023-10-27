@ROAD-4466
Feature: [QAA-52] FTP User And Files - File Manager

    As a user, I should be able to access File Manager of any FTP users

    @QAA-52
    Scenario Outline: [QAA-52] Access File Manager from FTP User
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        When I search for text "<ftp_user>" in FTP Users Page
        And I click "SFTPUserFiles"."FIRST_ROW_FILEMANAGER_BUTTON"
        And I switch to window "DreamHost File Manager"
        And I login with FTP File Manager with username "<ftp_user>" and hostname "<ftp_hostname>"
        Then I expect element "FileManager"."FTP_USER_LINK" contains text "<ftp_user>"

        Examples:
            | username | ftp_user | ftp_hostname       |
            | natman15 | qaa52    | dora.dreamhost.com |