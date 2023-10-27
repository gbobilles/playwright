@ROAD-4456
Feature: [QAA-114] DreamPress - Validate Domain with Dreampress Plan

  As a user, I should be able to Validate Domain with Dreampress Plan

  @QAA-114
  Scenario Outline: [QAA-114] Validate Domain with Dreampress Plan
    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I navigate to left panel "WEBSITES"
    And I navigate to left panel "MANAGE_WEBSITES"
    Then I expect page title to contain "DreamHost Web Panel > Websites"
    When I select list view of Manage Websites page
    And I select Manage record of domain "<domain>" in Manage Websites
    Then I expect element "ManageDreampress"."WHOLE_PAGE_LABEL" is displayed
    And I expect element "ManageDreampress"."DOMAIN_HEADER_FROM_MANAGE_WORD_PRESS" contains text "<domain>"
    And I expect page title to contain "DreamHost Web Panel > Websites : Manage Domain"

    Examples:
      | username                                          | domain              |
      | vigittamaria.sabu+testAutomation246@dreamhost.com | cxvdfgd.dream.press |
#| natman15 | nmmtest07.online  |