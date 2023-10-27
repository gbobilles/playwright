@ROAD-4550
Feature: [QAA-394] Add Standard HDD 4 Monthly

    As a user, I should able to add a Standard HDD 4 Monthly plan.
    
    @QAA-394
    Scenario Outline: [QAA-394] Add Standard HDD 4 Monthly
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
            And I navigate to left panel "DEDICATED_SERVER"
            And I navigate to left panel "DASHBOARD"
        When I click "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON"
        Then I expect Manage Dedicated - Configure Server page select the following
            |CPU         |Storage |RAM  |
            |Xeon 4-Core |1 TB    |4 GB |
            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            |Name           |CPU     |RAM       |Storage   |Image           | BillingPlan |Total|
            |Standard HDD 4 |4 Cores |4 GB RAM  |1 TB HDD  |Ubuntu 20.04 LTS| Monthly     |$169 |
        When I click "DedicatedServer"."CHECKOUT_NOW_BUTTON"
            And I wait for current page load completely
        Then I expect the Cart page displays the following information
           |ProductName             |ProductPrice |SelectedPlan                     |SelectedTerm|
           |Dedicated Server Hosting|$169.00/mo.  |Intel Xeon 4 core, 1 TB HDD, 4 GB|Monthly Plan|
           And I expect Order Summary displays the following information
           |ProductCount |YourSavings |TotalPrice|
           |1 item       |$0.00       |$169.00   |
        When I click "DedicatedServer"."SUBMIT_ORDER_BUTTON"
            And I wait for current page load completely
        Then I expect partial text "Congrats! Your order for a dedicated server has been successfully placed." is displayed   
        When I click "DedicatedServer"."CLOSE_ALERT_BUTTON"
        Given I navigate to left panel "DEDICATED_SERVER"
            And I navigate to left panel "DASHBOARD"
        When I click "DedicatedServer"."DASHBOARD"
            And I wait for Cancel Order button is displayed
        # Then I expect element "DedicatedServer"."SERVER_STATUS_LABEL" contains text "Pending"
        Then I expect the Dedicated Servers Dashboard displays the following information
            | Name    | Hardware_RAM | Hardware_Disk | Actions     |
            | Pending | 4 GB         | 1 TB          | Cancel Order|
        When I click "DedicatedServer"."CANCEL_ORDER_BUTTON"  
        Then I expect text "We have canceled your request for a Dedicated Server!" is displayed
        

     Examples:
    | username  |
    | aljsal1   |