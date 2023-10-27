@ROAD-4466
Feature: [QAA-280] SFTP Users & Files

    As a user, I should see the new SFTP Users & Files from Left nav menu and the landing page with new label

    @QAA-280
    Scenario Outline: [QAA-280] Access SFTP Users & Files
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        Then I expect element "LeftNavPanel"."SFTP_USERS_FILES_LINK" is displayed
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."SFTPUSERS_LABEL" is displayed

        Examples:
            | username |
            | natman15 |