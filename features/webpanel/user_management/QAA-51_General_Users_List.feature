@ROAD-4466
Feature: [QAA-51] FTP User And Files - General Users List

    As a user, I should be able to browse users up to the last record

    @QAA-51
    Scenario Outline: [QAA-51] General Users List - All Users
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"
        Then I expect element "SFTPUserFiles"."SFTPUSERS_LABEL" is displayed
        And I verify all ftp user rows are displayed

        Examples:
            | username | search_input     |
            | qaaaut6  | user_with_domain |