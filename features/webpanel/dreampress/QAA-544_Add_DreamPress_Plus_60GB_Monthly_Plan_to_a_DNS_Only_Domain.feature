@ROAD-4456
Feature: [QAA-544][Dream Press] -Add DreamPress Plus 60GB Monthly plan to a DNS Only domain

  As a user, I should able to see DreamPress Monthly plan.

  @QAA-544
  Scenario Outline: [QAA-544] AAdd DreamPress Plus 60GB Monthly plan to a DNS Only domain
    Given I navigate to PROD DHWEBPANEL
    And I login with username "<username>"
    #And I navigate to left panel "WORDPRESS"
    # And I navigate to left panel "MANAGED_WORDPRESS"
    And I navigate to left panel "ADD_MANAGED_WORDPRESS"
    When I click "ManageDreampress"."ADD_DREAMPRESS_BUTTON"
    And I select "<plan_domain>" in the Add dreamPress dropdown menu
    And I click "ManageDreampress"."MONTHLY_PLAN_BUTTON"
    Then I expect page title to contain "DreamHost Web Panel > Wordpress : Dashboard"
    When I click "ManageDreampress"."SELECT_PLUS_PLAN"
    Then I verify DreamPress purchase summery
      | Term    | plan | Storage | Cost_per_Month | New_Plan_Total |
      | Monthly | Plus | 60      | $34.99         | $34.99         |
    When I click "ManageDreampress"."ADD_NEW_DREAMPRESS_BUTTON"
    Then I expect page to have url containing "?tree=checkout.dashboard"
    And I click "ManageDreampress"."SUBMIT_ORDER_BUTTON"

    Then I expect element "ListViewPage"."SUCCESS_MESSAGE" to have long text
      """Successfully added DreamPress for <plan_domain>. It usually takes about 5 minutes to set everything up. Look for an email with your new username and instructions on how to set your password once setup is complete.
      """
    And I verify DreamPress Installation is completed
    #And I verify the domain "<plan_domain>" is listed with "<Plan>" plan
    When I navigate to left panel "BILLING_ACCOUNT"
    And I navigate to left panel "MANAGE_ACCOUNT"
    Then I verify the domain "<plan_domain>" is reflected with "<Term>" and "<Amount>"



    Examples:
      | username                                | plan_domain  | Plan       | Term    | Amount |
      | vigittamaria.sabu+test129@dreamhost.com | dnsonly2.xyz | DreamPress | Monthly | $23.99 |