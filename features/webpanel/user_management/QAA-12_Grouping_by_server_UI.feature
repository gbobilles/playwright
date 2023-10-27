@ROAD-4466 @user-management
Feature: [QAA-12] FTP User And Files - Grouping by server UI

    As a user, I should be able to group and ungroup list of FTP users

    @QAA-12 @XPROD-145
    Scenario Outline: [QAA-12] Group and Ungroup FTP User list
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Verify Group buttons
        When I wait for SFTP Page to load
        And I expect element "SFTPUserFiles"."GROUP_BY_USER_BUTTON" is displayed
        And I expect element "SFTPUserFiles"."GROUP_BY_SERVER_BUTTON" is displayed

        # Verify hover on Group By Server
        When I hover to "SFTPUserFiles"."GROUP_BY_SERVER_BUTTON"
        And I wait for SFTP Page to load
        Then I expect text "Group by server" is displayed

        # Verify Group Service Names exists
        When I click "SFTPUserFiles"."GROUP_BY_SERVER_BUTTON"
        And I wait for SFTP Page to load
        Then I expect element "SFTPUserFiles"."GROUP_SERVICE_NAME_LABEL" exists

        # Verify Group by User hover message is displayed
        When I hover to "SFTPUserFiles"."GROUP_BY_USER_BUTTON"
        Then I expect text "Group by user" is displayed

        # Verify Group Service Name does not appear when Grouped by user
        When I click "SFTPUserFiles"."GROUP_BY_USER_BUTTON"
        And I wait for SFTP Page to load
        Then I expect element "SFTPUserFiles"."GROUP_SERVICE_NAME_LABEL" does not exists

        Examples:
            | username |
            | natman15 |