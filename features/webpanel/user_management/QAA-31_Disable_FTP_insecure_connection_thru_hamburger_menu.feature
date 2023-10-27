@ROAD-4466 @user-management
Feature: [QAA-31] FTP User And Files - Disable insecure connections (FTP) thru Hamburger Menu

    As a user, I should be able to allow insecure connections with FTP

    @QAA-31
    Scenario Outline: [QAA-31] Disable FTP with insecure connection using the hamburger menu
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        When I search for SFTP User "<sftp_user>"
        And I disable FTP Insecure connection of user "<sftp_user>" thru hamburger menu
        Then I expect element "SFTPUserFiles"."INSECURE_CONNECTION_INDICATOR_ICON" is not displayed


        Examples:
            | username | sftp_user |
            | natmer12 | qaa_31    |