import { When, Then, DataTable} from '@cucumber/cucumber';
import { ICustomWorld } from '../support/custom-world';
import { Pages } from '../page_objects/map.po'
import BasePage from '../page_objects/base.po'
import { Locator, expect } from '@playwright/test';
import { ValidPageClasses } from '../types/pages';
import DedicatedServer from '../page_objects/add_product/dedicated_server.po';
import { time } from 'console';
import { options } from '../support/logger';



  When("I wait for Cancel Order button is displayed", async function (this: ICustomWorld) {
        const page = this.page!;

    let counter = 1

    while(true) {
  
    await page.reload({waitUntil:'load'})
    
    const dedicatedServer = new DedicatedServer(page)
    const element = page.locator(dedicatedServer.CANCEL_ORDER_BUTTON)
    const isCancelOrderButtonVisible = await dedicatedServer.base.isVisible(element)
  
      if (isCancelOrderButtonVisible) {
        break;
      }
  
      if(counter === 300) { // 5 minutes
        break;
      }
    }
  }) 

  When("I wait for current page load completely", async function (this: ICustomWorld) {
    const page = this.page!;
    await page.waitForLoadState();
  })


  Then("I expect Manage Dedicated - Configure Server page select the following", async function (this: ICustomWorld, datatable: DataTable) {
        const page = this.page!;
        const dedicatedServer = new DedicatedServer(page)

        const configureYourServers = datatable.hashes()

        for (let configureYourServer of configureYourServers ) {
            const CPU     = page.locator(dedicatedServer.CORES_OPTIONS_LABEL);
            const Storage = page.locator(dedicatedServer.DISK_OPTIONS_LABEL);
            const RAM     = page.locator(dedicatedServer.RAM_OPTIONS_LABEL);

            await expect(CPU).toContainText(configureYourServer.CPU)
            await expect(Storage).toContainText(configureYourServer.Storage)
            await expect(RAM).toContainText(configureYourServer.RAM)
            
        }
  })

  Then("I expect Manage Dedicated - Configure Server Order Summary panel displays the following", async function (this: ICustomWorld, datatable: DataTable) {
    const page = this.page!;
    const dedicatedServer = new DedicatedServer(page)

    const AddDedicatedOrderSummaries = datatable.hashes()

    for (let AddDedicatedOrderSummary of AddDedicatedOrderSummaries ) {
        const Name  = page.locator(dedicatedServer.ORDER_SUMMARY_PLAN_NAME_LABEL)
        const CPU   = page.locator(dedicatedServer.ORDER_SUMMARY_CPU_CORES_LABEL)
        const RAM   = page.locator(dedicatedServer.ORDER_SUMMARY_RAM_LABEL)
        const Storage = page.locator(dedicatedServer.ORDER_SUMMARY_STORAGE_LABEL)
        const Image = page.locator(dedicatedServer.ORDER_SUMMARY_IMAGE_LABEL)
        const BillingPlan = page.locator(dedicatedServer.ORDER_SUMMARY_BILLING_PLAN_BUTTON)
        const Total = page.locator(dedicatedServer.TOTAL_PRICE_LABEL)
        const btnCheckoutNow = page.locator(dedicatedServer.CHECKOUT_NOW_BUTTON)

        await expect(Name).toContainText(AddDedicatedOrderSummary.Name)
        await expect(CPU).toContainText(AddDedicatedOrderSummary.CPU)
        await expect(RAM).toContainText(AddDedicatedOrderSummary.RAM)
        await expect(Storage).toContainText(AddDedicatedOrderSummary.Storage)
        await expect(Image).toContainText(AddDedicatedOrderSummary.Image)
        await expect(BillingPlan).toContainText(AddDedicatedOrderSummary.BillingPlan)
        await expect(Total).toContainText(AddDedicatedOrderSummary.Total)

        await expect(btnCheckoutNow).toBeEnabled();
       
    }
})

    Then("I expect the Cart page displays the following information", async function (this: ICustomWorld, datatable: DataTable) {
        const page = this.page!;
        const dedicatedServer = new DedicatedServer(page)

        const dedicatedServerHostingCarts = datatable.hashes()

        for (let dedicatedServerHostingCart of dedicatedServerHostingCarts ) {
            const ProductName = page.locator(dedicatedServer.CART_PRODUCT_NAME_LABEL)
            // const ProductDescription = await page.locator('div[class^="info-"]>div[class^="description-"]')
            const ProductPrice = page.locator(dedicatedServer.CART_PRODUCT_PRICE_LABEL)
            const SelectedPlan = page.locator(dedicatedServer.CART_SELECTED_PLAN_LABEL)
            const SelectedTerm = page.locator(dedicatedServer.CART_SELECTED_TERM_LABEL)

            
            await expect(ProductName).toContainText(dedicatedServerHostingCart.ProductName)
            // await expect(ProductDescription).toContainText(dedicatedServerHostingCart.ProductDescription)
            await expect(ProductPrice).toContainText(dedicatedServerHostingCart.ProductPrice)
            await expect(SelectedPlan).toContainText(dedicatedServerHostingCart.SelectedPlan)
            await expect(SelectedTerm).toContainText(dedicatedServerHostingCart.SelectedTerm)
            
            }
    })

    Then("I expect Order Summary displays the following information", async function (this: ICustomWorld, datatable: DataTable) {
        const page = this.page!;
        const dedicatedServer = new DedicatedServer(page)

        const OrderSummaries = datatable.hashes()

        for (let OrderSummary of OrderSummaries ) {
            const ProductCount = page.locator(dedicatedServer.ORDER_SUMMARY_PRODUCT_COUNT_LABEL)
            const YourSavings = page.locator(dedicatedServer.ORDER_SUMMARY_YOUR_SAVINGS_LABEL)
            const TotalPrice = page.locator(dedicatedServer.ORDER_SUMMARY_TOTAL_LABEL)
            
            const SubmitOrderButton = page.locator(dedicatedServer.SUBMIT_ORDER_BUTTON)

            
            await expect(ProductCount).toContainText(OrderSummary.ProductCount)
            await expect(YourSavings).toContainText(OrderSummary.YourSavings)
            await expect(TotalPrice).toContainText(OrderSummary.TotalPrice)
            

            await expect(SubmitOrderButton).toBeEnabled();
            }
    })

    Then("I expect the Dedicated Servers Dashboard displays the following information", async function (this: ICustomWorld, datatable: DataTable) {
        const page = this.page!;
        const dedicatedServer = new DedicatedServer(page)

        const DashboardLists = datatable.hashes()

        for (let Dashboard of DashboardLists ) {
            const Name = page.locator(dedicatedServer.DBOARD_NAME_LABEL)
            const Hardware_RAM = page.locator(dedicatedServer.DBOARD_RAM_LABEL)
            const Hardware_Disk = page.locator(dedicatedServer.DBOARD_DISK_LABEL)
            const Actions = page.locator(dedicatedServer.DBOARD_ACTIONS_LABEL)
            
            await expect(Name).toContainText(Dashboard.Name)
            await expect(Hardware_RAM).toContainText(Dashboard.Hardware_RAM)
            await expect(Hardware_Disk).toContainText(Dashboard.Hardware_Disk)
            await expect(Actions).toContainText(Dashboard.Actions)
            
            }
    })
  
  