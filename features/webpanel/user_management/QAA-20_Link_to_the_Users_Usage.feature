@ROAD-4466 @user-management
Feature: [QAA-20] FTP User And Files - Link to the User's Disk Usage

    As a user, I should see the Disk Usage of any FTP User account

    @QAA-20
    Scenario Outline: [QAA-20] Access Disk Usage page of any FTP User
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "SFTP_USERS_FILES"

        # Search for FTP User
        When I search for SFTP User "<sftp_user>"

        # Verify Disk Summary page
        And I switch to tab Billing Disk Usage
        Then I expect text "The last month of disk usage for user "<sftp_user>" on <server>:" is displayed
        And I expect element "DiskSummary"."RETURN_DISK_SUMMARY_LINK" contains text "Return to disk usage summary"

        Examples:
            | username | sftp_user   | server   |
            | qaaaut4  | qaa_20_user | alvadore |