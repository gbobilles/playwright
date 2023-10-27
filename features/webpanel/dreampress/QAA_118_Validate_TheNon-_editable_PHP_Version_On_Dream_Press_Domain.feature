@ROAD-4456
Feature: [QAA-118] DreamPress - Validate Plan Page
  @QAA-118
  Scenario Outline: [QAA-118] Validate the non-editable PHP version on DreamPress domain
    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I navigate to left panel "WEBSITES"
    And I navigate to left panel "MANAGE_WEBSITES"
    Then I expect page title to contain "DreamHost Web Panel > Websites"
    When I select list view of Manage Websites page
    When I select DNS record of domain "<domain>" in Manage Websites
    Then I expect element "DNS"."DNS_TAB" is displayed
    Then I expect page title to contain "DreamHost Web Panel > Websites : Manage DNS"

    Examples:
      | username                                          | domain            |
      | vigittamaria.sabu+testAutomation244@dreamhost.com | dreampress.online |