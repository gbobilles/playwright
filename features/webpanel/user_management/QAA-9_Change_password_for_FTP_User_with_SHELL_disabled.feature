@ROAD-4466 @user-management
Feature: [QAA-9] FTP User And Files - Change password for user with SHELL disabled

    As a user, I should be able to change password with user's shell disabled

    @QAA-9
    Scenario Outline: [QAA-9] Change Password of any account with SSH disabled
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search SFTP user
        When I search for SFTP User "<sftp_user>"

        # Go to Change Password
        And I click "SFTPUserFiles"."CHANGE_PASSWORD_BUTTON"
        Then I expect text "This will create a new password for your SFTP user. If you have saved your password in an app or on a device, you will need to make sure to update it." is displayed

        # Perform Password update
        When I set value "<password>" to element "SFTPUserFiles"."CHANGE_PASSWORD_TEXTFIELD"
        And I click "SFTPUserFiles"."RESET_PASSWORD_BUTTON"
        Then I expect change password for SFTP User "<sftp_user>" is complete
        And I expect text "Success! Password has been updated." is displayed

        # Open File Manager
        When I switch to tab Dreamhost File Manager with username "<sftp_user>" and hostname "<hostname>"
        Then I expect element "FileManager"."SFTP_USER_LABEL" contains text "<sftp_user>"

        Examples:
            | username | sftp_user | hostname                | password        |
            | qaaaut6  | qaa_9_01  | troutdale.dreamhost.com | sftp_automation |