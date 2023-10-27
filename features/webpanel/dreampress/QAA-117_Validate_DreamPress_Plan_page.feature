@ROAD-4456
Feature: [QAA-117] DreamPress - Validate Plan Page

  As a user, I should be able to Validate Plan page of Dreampress

  @QAA-117
  Scenario Outline: [QAA-117] Validate Plan page of Dreampress
    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I navigate to left panel "WEBSITES"
    And I navigate to left panel "MANAGE_WEBSITES"
    Then I expect page title to contain "DreamHost Web Panel > Websites"
    When I select list view of Manage Websites page
    And I select DNS record of domain "<domain>" in Manage Websites
    Then I expect element "DNS"."DNS_TAB" is displayed
    When I jsclick "DNS"."ADD_RECORD_BUTTON"
    When I jsclick "DNS"."A_RECORD_LINK"
    And I set value field of DNS "A" record to "<dns_a_record>"
    When I click "DNS"."FINAL_ADD_RECORD_BUTTON"
    Then I expect element "DNS"."ERROR_MESSAGEL_A_RECORD_TEXT" contains text "DreamPress Hosting must be removed from this domain before root-level custom DNS records of this type may be added. To configure a subdomain, enter it in the Host field above."

    Examples:
      | username | domain                      | dns_a_record |
      | hghhgh8  | newdomain01062023184530.com | 23.65.12.54  |