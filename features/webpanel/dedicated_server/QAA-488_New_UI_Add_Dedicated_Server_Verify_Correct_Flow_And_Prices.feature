@ROAD-4550
Feature: [QAA-488] New UI : Verify correct flow and prices

    As a user, I should able to test correct flow and prices on the Dashboard Dedicated Servers page from DreamHost Webpanel. 
    
    @QAA-488
    Scenario Outline: [QAA-488] Verify correct flow and prices
        
    Given I navigate to DHWEBPANEL
        And I login with username "<username>"
        And I navigate to left panel "DEDICATED_SERVER"
        And I navigate to left panel "DASHBOARD"
    # Then I expect element "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON" is clickable
    When I click "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON"
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage | RAM |
        | Xeon 4-Core | 1 TB    | 4 GB|
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name           | CPU     | RAM      | Storage  | Image            | BillingPlan | Total |
        | Standard HDD 4 | 4 Cores | 4 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $169  |
    # Step 4
    When I click "DedicatedServer"."CANCEL_BUTTON"
    # Then I expect element "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON" is clickable
    # Step 5
    When I click "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage | RAM  |
        | Xeon 4-Core | 1 TB    | 4 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name           | CPU    | RAM        | Storage  | Image             | BillingPlan | Total |
        | Standard HDD 4 | 4 Cores| 4 GB RAM   | 1 TB HDD | Ubuntu 20.04 LTS  | Monthly     | $169  |
    # Step 6
    When I click "DedicatedServer"."EIGHT_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage |RAM  |
        | Xeon 4-Core | 1 TB    |8 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name           | CPU     | RAM      | Storage  | Image            | BillingPlan | Total |
        | Standard HDD 8 | 4 Cores | 8 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $209  |
    
    # Step 7
    When I click "DedicatedServer"."SIXTEEN_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU         | Storage | RAM   |
        | Xeon 4-Core | 1 TB    | 16 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU     | RAM       | Storage  | Image            | BillingPlan | Total |
        | Standard HDD 16 | 4 Cores | 16 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $249  |
    
    # Step 8
    When I click "DedicatedServer"."XEON_12_CORE_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM   |
        | Xeon 12-Core | 2 TB    | 16 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU      | RAM       | Storage  | Image            | BillingPlan | Total |
        | Enhanced HDD 16 | 12 Cores | 16 GB RAM | 2 TB HDD | Ubuntu 20.04 LTS | Monthly     | $299  |
    
    # Step 9
    When I click "DedicatedServer"."THIRTY_TWO_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM   |
        | Xeon 12-Core | 2 TB    | 32 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU      | RAM       | Storage  | Image            | BillingPlan | Total |
        | Enhanced HDD 32 | 12 Cores | 32 GB RAM | 2 TB HDD | Ubuntu 20.04 LTS | Monthly     | $349  |
    
    # Step 10
    When I click "DedicatedServer"."SIXTY_FOUR_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM   |
        | Xeon 12-Core | 2 TB    | 64 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU      | RAM       | Storage  | Image            | BillingPlan | Total |
        | Enhanced HDD 64 | 12 Cores | 64 GB RAM | 2 TB HDD | Ubuntu 20.04 LTS | Monthly     | $399  |
    
    # Step 11
    When I click "DedicatedServer"."TWO_HUNDRED_FOURTY_GB_SSD_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM   |
        | Xeon 12-Core | 240 GB  | 64 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU      | RAM       | Storage                   | Image            | BillingPlan | Total |
        | Enhanced SSD 64 | 12 Cores | 64 GB RAM | 240 GB Lightning-Fast SSD | Ubuntu 20.04 LTS | Monthly     | $399  |
    
    # Step 12
    When I click "DedicatedServer"."SIXTEEN_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM   |
        | Xeon 12-Core | 240 GB  | 16 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU      | RAM       | Storage                   | Image            | BillingPlan | Total |
        | Enhanced SSD 16 | 12 Cores | 16 GB RAM | 240 GB Lightning-Fast SSD | Ubuntu 20.04 LTS | Monthly     | $299  |
    
    # Step 13
    When I click "DedicatedServer"."THIRTY_TWO_GB_RAM_BUTTON"
        And I wait for current page load completely
    Then I expect Manage Dedicated - Configure Server page select the following
        | CPU          | Storage | RAM   |
        | Xeon 12-Core | 240 GB  | 32 GB |
        And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
        | Name            | CPU      | RAM       | Storage                   | Image            | BillingPlan | Total |
        | Enhanced SSD 32 | 12 Cores | 32 GB RAM | 240 GB Lightning-Fast SSD | Ubuntu 20.04 LTS | Monthly     | $349  |
    
    # Step 14
    When I click "DedicatedServer"."CANCEL_BUTTON"
    # Then I expect element "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON" is clickable

     Examples:
    | username  |
    | aljsal1   |