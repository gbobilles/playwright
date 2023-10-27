@ROAD-2271 @user-management
Feature: [QAA-3] FTP User And Files - Server name as host

  As a user, I should see tooltips for Hostname and Username are displayed

  @QAA-3
  Scenario Outline: [QAA-3] Display Username and Hostname Tooltip

    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I navigate to left panel "WEBSITES"
    And I navigate to left panel "SFTP_USERS_FILES"

    # Search for SFTP User
    When I search for SFTP User "<sftp_user>"
    Then I expect element "SFTPUserFiles"."SEARCHED_USERNAME_LOGIN_INFO" contains text "<sftp_user>"

    # Verify Hostname
    Then I expect element "SFTPUserFiles"."SEARCHED_HOSTNAME_LOGIN_INFO" contains value "<hostname>"

    # Go to SSH Keys page
    When I navigate to left panel "MORE"
    And I navigate to left panel "SSH_KEYS"

    # Verify Hostname is displayed in SSH Keys page
    Then I expect text "<hostname>" is displayed

    Examples:
      | username | sftp_user | hostname           |
      | natman15 | qaa3_user | dora.dreamhost.com |