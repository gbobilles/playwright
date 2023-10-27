@ROAD-4466
Feature: [QAA-69] FTP User And Files - Streamlined create user UI

    As an end-user I need to be able to create new SFTP users in a quick and easy manner.

    @QAA-69
    Scenario Outline: [QAA-69] Create FTP User
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."FTP_USER_TABLE" is displayed
        When I create a new FTP User
        Then I should see newly created FTP user is displayed

        Examples:
            | username |
            | natman15 |