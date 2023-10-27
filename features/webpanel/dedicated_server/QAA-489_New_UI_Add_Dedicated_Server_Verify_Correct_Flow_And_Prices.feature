@ROAD-4550
Feature: [QAA-489] New UI : Verify correct flow and prices

    As a user, I should able to test correct flow and prices on the Dashboard Dedicated Servers page from DreamHost Webpanel. 
    
    @QAA-489
    Scenario Outline: [QAA-489] Verify correct flow and prices
        
    Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "ADD_DEDICATED_SERVER"
    Then I expect text "Dedicated Server Hosting" is displayed
        And I expect text "Choose your RAM, hard drive and processing power based on your needs." is displayed
        And I expect text "Starting at only $149/mo." is displayed
    When I click "DedicatedServer"."ADD_A_DEDICATED_SERVER_BUTTON"  
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage | RAM  |
        | Xeon 4-Core | 1 TB    | 4 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU     | RAM      | Storage  | Image            | BillingPlan | Total |
            | Standard HDD 4 | 4 Cores | 4 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $169  |
    When I click "DedicatedServer"."CANCEL_BUTTON"
        And I click "DedicatedServer"."ADD_A_DEDICATED_SERVER_BUTTON"
    Then I expect Manage Dedicated - Configure Server page select the following
        |CPU        |Storage| RAM |
        |Xeon 4-Core|1 TB   | 4 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU     | RAM      | Storage  | Image            | BillingPlan | Total |
            | Standard HDD 4 | 4 Cores | 4 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $169  |  
    When I click "DedicatedServer"."EIGHT_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU        | Storage | RAM |
        | Xeon 4-Core| 1 TB    | 8 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU     | RAM      | Storage  | Image           | BillingPlan | Total |
            | Standard HDD 8 | 4 Cores | 8 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS| Monthly     | $209  |
    When I click "DedicatedServer"."SIXTEEN_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
            | CPU         | Storage | RAM  |
            | Xeon 4-Core | 1 TB    | 16 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU    | RAM      | Storage  | Image           | BillingPlan | Total |
            | Standard HDD 16| 4 Cores| 16 GB RAM| 1 TB HDD | Ubuntu 20.04 LTS| Monthly     | $249  |   
    When I click "DedicatedServer"."XEON_12_CORE_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
            | CPU          | Storage | RAM   |
            | Xeon 12-Core | 2 TB    | 16 GB |
            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name            | CPU      | RAM       | Storage  | Image            | BillingPlan | Total |
            | Enhanced HDD 16 | 12 Cores | 16 GB RAM | 2 TB HDD | Ubuntu 20.04 LTS | Monthly     | $299  |   
    When I click "DedicatedServer"."THIRTY_TWO_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
            | CPU          | Storage | RAM   |
            | Xeon 12-Core | 2 TB    | 32 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name            | CPU      | RAM       | Storage  | Image            | BillingPlan | Total |
            | Enhanced HDD 32 | 12 Cores | 32 GB RAM | 2 TB HDD | Ubuntu 20.04 LTS | Monthly     | $349  |
    When I click "DedicatedServer"."SIXTY_FOUR_GB_RAM_BUTTON"
    And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
            | CPU         | Storage| RAM  |
            | Xeon 12-Core| 2 TB   | 64 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name            | CPU      | RAM       | Storage  | Image            | BillingPlan | Total |
            | Enhanced HDD 64 | 12 Cores | 64 GB RAM | 2 TB HDD | Ubuntu 20.04 LTS | Monthly     | $399  |
    When I click "DedicatedServer"."TWO_HUNDRED_FOURTY_GB_SSD_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage| RAM  |
        | Xeon 12-Core| 240 GB | 64 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name            | CPU      | RAM       | Storage                   | Image            | BillingPlan | Total |
            | Enhanced SSD 64 | 12 Cores | 64 GB RAM | 240 GB Lightning-Fast SSD | Ubuntu 20.04 LTS | Monthly     | $399  |
    When I click "DedicatedServer"."SIXTEEN_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage | RAM  |
        | Xeon 12-Core| 240 GB  | 16 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU      | RAM       | Storage                   | Image            | BillingPlan |Total |
            | Enhanced SSD 16| 12 Cores | 16 GB RAM | 240 GB Lightning-Fast SSD | Ubuntu 20.04 LTS | Monthly     |$299  | 
    When I click "DedicatedServer"."THIRTY_TWO_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM  |
        | Xeon 12-Core | 240 GB  | 32 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name            | CPU      | RAM       | Storage                   | Image            | BillingPlan | Total |
            | Enhanced SSD 32 | 12 Cores | 32 GB RAM | 240 GB Lightning-Fast SSD | Ubuntu 20.04 LTS | Monthly     | $349  |
    When I click "DedicatedServer"."CANCEL_BUTTON"

     Examples:
    | username  |
    | anntar5   |