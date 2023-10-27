@ROAD-4466
Feature: [QAA-363] FTP User And Files - Switch Domain User to an Admin FTP User

    As a user, I should be not be able to switch a hosted domain ftp user to an Admin FTP User

    @QAA-363
    Scenario Outline: [QAA-363] Switch User to an Admin FTP User
        Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "WEBSITES"
        And I navigate to left panel "MANAGE_WEBSITES"
        Then I expect element "ManageWebsites"."WEBSITES_LABEL" is displayed
        When I search domain "<domain>" from Manage Websites
        And I select Manage tab of domain "<domain>" from Manage Websites
        And I click "Website"."LOGIN_INFO_BUTTON"
        And I click "Website"."SWITCH_USER_BUTTON"
        And I switch to ftp user "<ftp_user>" from Websites Page
        Then I expect text "Changes cannot be made." is displayed
        And I expect text "Admin users cannot be assigned to a website." is displayed
        And I expect element "Website"."SWITCH_USER_SAVE_BUTTON" is not enabled

        Examples:
            | username | ftp_user  | domain              |
            | aljsal1  | dh_f59qwd | bluefurrydog.online |