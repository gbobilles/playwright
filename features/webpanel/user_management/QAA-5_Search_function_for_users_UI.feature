@ROAD-4466 @user-management
Feature: [QAA-5] FTP User And Files - Search FTP Users

    As a user, I should be able to search for FTP users using the search textfield

    @QAA-5
    Scenario Outline: [QAA-5] Search function for users UI
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search for SFTP User
        When I search for SFTP User "<sftp_user>"
        Then I expect element "SFTPUserFiles"."USERNAME_LABEL" contains text "<sftp_user>"

        Examples:
            | username | sftp_user                  |
            | natman15 | user_with_domain1671114078 |