@ROAD-4466 @user-management
Feature: [QAA-32] FTP User And Files - Disable FTP Thru Login Info

    As a user, I should be able to disable ftp thru login info option

    @QAA-32
    Scenario Outline: [QAA-32] Disable FTP thru login info
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search for SFTP user
        When I search for SFTP User "<sftp_user>"
        And I disable FTP Insecure connection of user "<sftp_user>" thru Login Info
        Then I expect element "SFTPUserFiles"."INSECURE_CONNECTION_INDICATOR_ICON" is not displayed

        Examples:
            | username | sftp_user |
            | natman15 | qaa_32    |