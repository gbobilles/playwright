@ROAD-4456
Feature: [QAA-49]Directly Load the DreamPress Plan URL
  As a user, I should be able to Directly Load the DreamPress Plan URL

  @QAA-49
  Scenario Outline: [QAA-49][WebPanel][WordPress][Managed WordPress]-Directly Load the DreamPress Plan URL
    Given I navigate to DHWEBPANEL
    And I login with username "<username>"
    And I navigate to left panel "WORDPRESS"
    And I navigate to left panel "MANAGED_WORDPRESS"
    When I pass the text "<append_url>" directly in to the current URL
    Then I expect element "ManageDreampress"."MAIN_CONTENT_LABEL" is displayed
    And I expect element "ManageDreampress"."DOMAIN_HEADER" contains text "<domain>"
    And I expect page title to contain "DreamHost Web Panel > Wordpress : Dashboard"
    When I remove "<append_url>" and replace with "<second_append_url>" in the current url
    Then I expect text "change your plan" is displayed
    And I expect element "ManageDreampress"."SELECT_WHOLE_PLAN_CARD" is displayed





    Examples:
      | username                                          | append_url                        | domain              | second_append_url                    |
      | vigittamaria.sabu+testAutomation246@dreamhost.com | /site/cxvdfgd.dream.press/hosting | cxvdfgd.dream.press | /dreampress/cxvdfgd.dream.press/plan |