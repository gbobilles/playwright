@ROAD-4466
Feature: [QAA-454] FTP User And Files - Close Login Info view when out of viewport

    As a user, all Login Info views should be closed when it's out of viewport.

    @QAA-454 @XPROD-307
    Scenario Outline: [QAA-454] Verify All Login Info views are closed
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        When I wait for FTP Users & Files Page to load
        And I open Login Info of 5 SFTP Users
        Then I verify Login Info view of SFTP Users table are closed

        Examples:
            | username |
            | natman15 |