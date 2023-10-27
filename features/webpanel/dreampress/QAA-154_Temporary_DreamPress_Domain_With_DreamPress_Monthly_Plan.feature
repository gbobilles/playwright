@ROAD-4456
Feature: [QAA-154] Managed WordPres - Add DreamPress - Temporary dream.press domain with DreamPress monthly plan

  @QAA-154
  Scenario Outline: [QAA-154] Temporary dream.press domain with DreamPress monthly plan validation(domain is listed with DreamPress Pro hosting)
    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I navigate to left panel "WORDPRESS"
    And I navigate to left panel "MANAGED_WORDPRESS"
    When I click "ManageDreampress"."ADD_DREAMPRESS_BUTTON"
    Then I expect page title to contain "DreamHost Web Panel > Wordpress : Dashboard"
    #When I click "ManageDreampress"."ADD_NEW_DOMAIN_BUTTON"
    When I jsclick "ManageDreampress"."ADD_TEMPORY_DOMAIN_RADIO_BUTTON"
    And I add temporary domain
    And I click "ManageDreampress"."ADD_DREAM_PRESS_BUTTON"
    Then I expect element "ManageDreampress"."CHOOSE_ANOTHER_DOMAIN_BUTTON" is displayed
    When I jsclick "ManageDreampress"."SELECT_PRO_PLAN"
    And I click "ManageDreampress"."ADD_NEW_DREAMPRESS_BUTTON"
    Then I verify the temporary domain is listed with DreamPress Pro hosting
    When I navigate to left panel "BILLING_ACCOUNT"
    And I navigate to left panel "MANAGE_ACCOUNT"
    Then I verify the temporary domain is reflected with DreamPress Pro yearly plan
    Examples:
      | username                                          |
      | vigittamaria.sabu+testAutomation277@dreamhost.com |