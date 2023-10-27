@ROAD-4466
Feature: [QAA-68] FTP User And Files - Change password for user with SHELL enabled

    As a user, I should be able to change password with user's shell enabled

    @QAA-68
    Scenario Outline: [QAA-68] Change Password of any account with SSH enabled
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        When I search for text "<ftp_user>" in FTP Users Page
        And I click "SFTPUserFiles"."CHANGE_PASSWORD_BUTTON"
        Then I expect element "SFTPUserFiles"."RESET_PASSWORD_DESCRIPTION_LABEL" to have long text
            """
            This will create a new password for your SHELL user. If you have saved your password in an app or on a device, you will need to make sure to update it.
            """
        When I set "automation_pass" to inputfield "SFTPUserFiles"."RESET_PASSWORD_TEXTFIELD"
        And I click "SFTPUserFiles"."RESET_PASSWORD_BUTTON"
        And I wait for FTP update progress to finish
        And I click "SFTPUserFiles"."FIRST_ROW_FILEMANAGER_BUTTON"
        And I switch to window "DreamHost File Manager"
        And I login with FTP File Manager with username "<ftp_user>" and hostname "<ftp_hostname>"
        Then I expect element "FileManager"."FTP_USER_LINK" contains text "<ftp_user>"

        Examples:
            | username | ftp_user  | ftp_hostname            |
            | qaaaut6  | qaa_68_01 | troutdale.dreamhost.com |