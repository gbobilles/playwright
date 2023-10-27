@ROAD-4550
Feature: [QAA-408] Adding another Dedicated to a pending cart with Dedicated

    As a user, I should able to add only 1 Dedicated Server Hosting product can be added to the cart at a time when adding Dedicated Server Hosting  for a Dedicated customer.
    
    @QAA-408
    Scenario Outline: [QAA-408] Adding another Dedicated to a pending cart with Dedicated
        Given I navigate to DHWEBPANEL
            And I login with username "<username>"
            And I navigate to left panel "DEDICATED_SERVER"
            And I navigate to left panel "DASHBOARD"
        When I click "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON"
        Then I expect Manage Dedicated - Configure Server page select the following
            | CPU         | Storage | RAM  |
            | Xeon 4-Core | 1 TB    | 4 GB |

            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU    | RAM        | Storage    | Image              | BillingPlan | Total |
            | Standard HDD 4 | 4 Cores| 4 GB RAM   | 1 TB HDD   | Ubuntu 20.04 LTS   | Monthly     | $169  |
        When I click "DedicatedServer"."XEON_4_CORE_BUTTON"
            And I click "DedicatedServer"."ONE_TB_HDD_BUTTON"
            And I click "DedicatedServer"."FOUR_GB_RAM_BUTTON"
            And I click "DedicatedServer"."MONTHLY_BILLING_PLAN_BUTTON"
            And I wait for current page load completely
        Then I expect Manage Dedicated - Configure Server page select the following
            | CPU        | Storage | RAM    |
            | Xeon 4-Core| 1 TB    | 4 GB   |

            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU    | RAM      | Storage  | Image            | BillingPlan | Total |
            | Standard HDD 4 | 4 Cores| 4 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $169  |
        When I click "DedicatedServer"."CHECKOUT_NOW_BUTTON"
            And I wait for current page load completely
        Then I expect the Cart page displays the following information
            | ProductName               | ProductPrice | SelectedPlan                      | SelectedTerm |
            | Dedicated Server Hosting  | $169.00/mo.  | Intel Xeon 4 core, 1 TB HDD, 4 GB | Monthly Plan |

            And I expect Order Summary displays the following information
            | ProductCount |YourSavings | TotalPrice |
            | 1 item       |$0.00       | $169.00    |
        # Back Flow
        When I click "DedicatedServer"."BACK_BUTTON"  
        Then I expect Manage Dedicated - Configure Server page select the following
            | CPU         | Storage | RAM  |
            | Xeon 4-Core | 1 TB    | 4 GB |

            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU    | RAM     | Storage  | Image            | BillingPlan | Total |
            | Standard HDD 4 | 4 Cores| 4 GB RAM| 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $169  |
        When I click "DedicatedServer"."CANCEL_DEFAULT_BUTTON"  
            And I wait for current page load completely 
        Then I expect element "DedicatedServer"."CART_LABEL" contains text "1"
            # And I expect text "Whoops! Could not find that dedicated order. The order may have already been fulfilled or canceled." is displayed
        #Add 2nd Dedicated Server
        When I click "DedicatedServer"."ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON"
         Then I expect Manage Dedicated - Configure Server page select the following
            | CPU        | Storage | RAM  |
            | Xeon 4-Core| 1 TB    | 4 GB |

            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU     | RAM      | Storage  | Image            | BillingPlan | Total |
            | Standard HDD 4 | 4 Cores | 4 GB RAM | 1 TB HDD | Ubuntu 20.04 LTS | Monthly     | $169  |
        #Add Enhanced HDD 16 Yearly
        When I click "DedicatedServer"."XEON_12_CORE_BUTTON"
            And I click "DedicatedServer"."TWO_TB_HDD_BUTTON"
            And I click "DedicatedServer"."SIXTEEN_GB_RAM_BUTTON"
            And I click "DedicatedServer"."YEARLY_BILLING_PLAN_BUTTON"
        Then I expect Manage Dedicated - Configure Server page select the following
            | CPU            | Storage | RAM   |
            | Xeon 12-Core   | 2 TB    | 16 GB |

            And I expect Manage Dedicated - Configure Server Order Summary panel displays the following
            | Name           | CPU        | RAM        | Storage    | Image            | BillingPlan | Total |
            | Enhanced HDD 16| 12 Cores   | 16 GB RAM  | 2 TB HDD   | Ubuntu 20.04 LTS | Yearly      | $3348 |
        When I click "DedicatedServer"."CHECKOUT_NOW_BUTTON"
            And I wait for current page load completely
        #2nd Cart Page 
        Then I expect the Cart page displays the following information
            | ProductName              | ProductPrice | SelectedPlan                        | SelectedTerm |
            | Dedicated Server Hosting | $3348.00/yr. | Intel Xeon 12 core, 2 TB HDD, 16 GB | Yearly Plan  |

            And I expect Order Summary displays the following information
            | ProductCount | YourSavings | TotalPrice |
            | 1 item       | $240.00     | $3348.00   |
        #Submit Order
        When I click "DedicatedServer"."SUBMIT_ORDER_BUTTON"
        Then I expect partial text "Congrats! Your order for a dedicated server has been successfully placed." is displayed   
        When I click "DedicatedServer"."CLOSE_ALERT_BUTTON"
        Given I navigate to left panel "DEDICATED_SERVER"
            And I navigate to left panel "DASHBOARD"
        When I click "DedicatedServer"."DASHBOARD"
            And I wait for Cancel Order button is displayed
        # Then I expect element "DedicatedServer"."SERVER_STATUS_LABEL" contains text "Pending"
        Then I expect the Dedicated Servers Dashboard displays the following information
            | Name    | Hardware_RAM | Hardware_Disk | Actions     |
            | Pending | 16 GB        | 2 TB          | Cancel Order|
        When I click "DedicatedServer"."CANCEL_ORDER_BUTTON"  
        Then I expect text "We have canceled your request for a Dedicated Server!" is displayed
            
     Examples:
    | username  |
    | aljsal1   |