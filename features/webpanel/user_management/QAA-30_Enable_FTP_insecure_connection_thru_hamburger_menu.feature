@ROAD-4466 @user-management
Feature: [QAA-30] FTP User And Files - Enable FTP (Port 21) / Allow insecure connections (FTP) thru hamburger menu

    As a user, I should be able to allow insecure connections with FTP thru hamburger menu

    @QAA-30
    Scenario Outline: [QAA-30] Enable FTP with insecure connection
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        When I search for SFTP User "<sftp_user>"
        And I enable FTP Insecure connection of user "<sftp_user>" thru hamburger menu
        Then I expect element "SFTPUserFiles"."INSECURE_CONNECTION_INDICATOR_ICON" is displayed

        Examples:
            | username | sftp_user |
            | natmer12 | qaa_30    |