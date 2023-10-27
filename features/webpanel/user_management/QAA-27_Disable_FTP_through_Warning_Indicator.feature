@ROAD-4466 @user-management
Feature: [QAA-27] FTP User And Files - Disable FTP Thru Warning Indicator

    As a user, I should be able to disable ftp thru warning indicator icon

    @QAA-27
    Scenario Outline: [QAA-27] Disable FTP thru Warning Indicator

        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search SFTP user
        When I search for SFTP User "<sftp_user>"

        # Disable Insecure Connection
        When I disable FTP Insecure connection of user "<sftp_user>" thru warning indicator icon
        Then I expect element "SFTPUserFiles"."INSECURE_CONNECTION_INDICATOR_ICON" is not displayed

        Examples:
            | username | sftp_user |
            | natman15 | qaa_27    |