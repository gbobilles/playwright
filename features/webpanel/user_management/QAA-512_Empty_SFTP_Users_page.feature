@ROAD-4466
Feature: [QAA-512] FTP User And Files - Empty SFTP Users Page

    As a user, I should be able to see the initial page of SFTP Users & Files page when empty and be able to add new user

    @QAA-512
    Scenario Outline: [QAA-512] Add new user on empty SFTP Users page
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        When I wait for FTP Users & Files Page to load
        And I cleanup SFTP User List
        Then I expect element "SFTPUserFiles"."CREATE_USER_ON_EMPTY_BUTTON" is clickable
        And I expect text "No active users found" is displayed
        When I create a new FTP User
        Then I should see newly created FTP user is displayed

        Examples:
            | username |
            | empuse   |