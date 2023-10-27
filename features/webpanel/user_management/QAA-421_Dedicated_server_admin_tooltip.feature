@ROAD-4466
Feature: [QAA-421] FTP User And Files - Enabled Admin Tooltip

    As a user with dedicated server product and with Admin enabled sftp accounts, I should be able to see the Admin Tooltip

    @QAA-421 @XPROD-149
    Scenario Outline: [QAA-421] Verify Admin Tooltip on SFTP Users Page
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        When I wait for FTP Users & Files Page to load
        And I search for text "qaa_421_admin" in FTP Users Page
        And I click "SFTPUserFiles"."HIDE_INFO_BUTTON"
        And I hover to "SFTPUserFiles"."ADMIN_TOOLTIP"
        Then I expect text "Root/Sudo privileges enabled for this user." is displayed

        Examples:
            | username |
            | aljsal1  |