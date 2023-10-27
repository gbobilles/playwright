@ROAD-4466 @user-management
Feature: [QAA-6] FTP User And Files - Delete SFTP User with domain attached

    As an end-user I should be able to delete SFTP users that is tied up to a domain

    @QAA-6
    Scenario Outline: [QAA-6] Delete SFTP User with no domain attached
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search for SFTP user
        When I search for SFTP User "<sftp_user>"

        # Delete SFTP User
        When I click "SFTPUserFiles"."SFTP_CONTEXT_MENU_BUTTON"
        And I click "SFTPUserFiles"."DELETE_BUTTON"

        # Verify warning message
        Then I expect text "Sorry, you can't delete this user" is displayed
        Then I expect text "The user you are attempting to delete holds data for <domain>. Please visit the Manage Domains page to delete the site or move it to a new user." is displayed


        Examples:
            | username | sftp_user  | domain        |
            | useaut   | qaa_6_demo | nmm-dh-01.xyz |