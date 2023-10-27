@ROAD-4466 @user-management
Feature: [QAA-7] FTP User And Files - Delete FTP User with no domain attached

    As an end-user I should be able to delete FTP users that are not tied up to any domains

    @QAA-7
    Scenario Outline: [QAA-7] Delete FTP User with no domain attached
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        When I delete SFTP User "<sftp_user>"
        Then I expect deleted SFTP User "<sftp_user>" is not displayed

        Examples:
            | username | sftp_user |
            | useaut   | qaa_7     |