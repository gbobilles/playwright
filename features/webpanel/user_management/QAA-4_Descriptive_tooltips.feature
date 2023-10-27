@ROAD-4466 @user-management
Feature: [QAA-4] FTP User And Files - Descriptive Tooltips

    As a user, I should be able to search for FTP users using the search textfield

    @QAA-4
    Scenario Outline: [QAA-4] Display Username and Hostname Tooltip
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search for SFTP User
        Then I expect element "SFTPUserFiles"."SEARCH_TEXTFIELD" is displayed
        When I search for SFTP User "<sftp_user>"

        # Verify Host Tooltip Icon
        And I hover to "SFTPUserFiles"."HOST_TOOLTIP_ICON"
        Then I expect text "The server host name is the web server your files are hosted on. Use this host name when connecting using a FTP/SFTP or SSH client." is displayed

        # # Verify Username Tooltip Icon
        And I hover to "SFTPUserFiles"."USERNAME_TOOLTIP_ICON"
        Then I expect text "Username is used when connecting to your web server using a FTP/SFTP or SSH client. This username is not used for managing your DreamHost web panel or WordPress dashboard." is displayed

        Examples:
            | username | sftp_user |
            | natman15 | dh_5pkbx4 |