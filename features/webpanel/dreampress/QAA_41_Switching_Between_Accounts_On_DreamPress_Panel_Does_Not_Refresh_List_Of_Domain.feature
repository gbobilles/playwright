@ROAD-4456
Feature: [QAA-41] Switching between accounts on DreamPress panel does not refresh list of domain

       As a user, Switching between accounts on DreamPress panel does not refresh list of domain

       @QAA-41
       Scenario Outline: [QAA-41] Switching between accounts on DreamPress panel does not refresh list of domain
              Given I navigate to DHWEBPANEL
              And I login with username "<username>"
              And I navigate to left panel "WORDPRESS"
              And I navigate to left panel "MANAGED_WORDPRESS"
              Then account1_wordpress is listed under Manage Wordpress Page
              # When I switch to webid "<webid>"

              Examples:
                     | username                                          |
                     | vigittamaria.sabu+testAutomation277@dreamhost.com |