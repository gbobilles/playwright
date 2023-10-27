@ROAD-4456
Feature: [QAA-40] Dreampress - Grant Privileges to Sub Accounts

  As the main account, I should be able to grant access to my sub-accounts

  @QAA-40
  Scenario Outline: [QAA-40] Grant access to DreamPress instance via Account Privileges
    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I switch to webid "<webid>"
    And I navigate to left panel "BILLING_ACCOUNT"
    And I navigate to left panel "MANAGE_ACCOUNT"
    Then I expect element "ManageAccount"."USER_ID_LABEL" contains text "<user_id>"
    When I click "ManageAccount"."EDIT_PRIVILEGES_LINK"
    And I click Edit Privilege for account "<privileged_account>"
    Then I expect text "patrick.gateley@seattlechildrens.org" is displayed
    And I expect domain "live\.seattlechildrens\.org" is selected for user "patrick.gateley"
    And I expect server "dp-7c94e430e5" is selected for user "patrick.gateley"



    Examples:
      | username | webid   | user_id | privileged_account |
      | natman14 | maradm1 | 2404745 | patrickgateley     |