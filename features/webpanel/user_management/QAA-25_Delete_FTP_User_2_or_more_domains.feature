@ROAD-4466 @user-management
Feature: [QAA-25] FTP User And Files - Delete FTP User with more than 1 domain attached

    As an end-user I should be able to delete FTP users that is tied up to more than 1 domain

    @QAA-25
    Scenario Outline: [QAA-25] Delete FTP User with 2 domains attached

        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search SFTP user
        When I search for SFTP User "<sftp_user>"

        # Delete SFTP User
        When I click "SFTPUserFiles"."SFTP_CONTEXT_MENU_BUTTON"
        And I click "SFTPUserFiles"."DELETE_BUTTON"

        # Verify warning message
        Then I expect element "SFTPUserFiles"."DELETE_SFTP_USER_BUTTON" is displayed
        Then I expect text "Sorry, you can't delete this user" is displayed
        Then I expect partial text "You have multiple domains hosted under this user." is displayed

        Examples:
            | username | sftp_user | domain        |
            | useaut   | qaa_25    | nmm-dh-01.xyz |