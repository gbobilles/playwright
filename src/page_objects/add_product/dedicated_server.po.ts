import { Page } from '@playwright/test';
import Base from '../base.po';

export default class DedicatedServer {

  [linkName: string]: any;

  public base: Base;
  constructor(private page: Page) {
    this.base = new Base(page);
  }


// class DedicatedServer extends Base {
  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  // Labels
  get ALERT_TEXT_LABEL() { return  `//*[@class='Alert__text']`}
  get CART_LABEL () { return  `div[id='universal-checkout-cart-portal']` }
  get PRODUCT_ITEM_LABEL () { return  `div[class*='title-']` }
  get PRODUCT_INFO_LABEL () { return  `div[class*='products-']`}
  get TOTAL_PRICE_LABEL() { return  "//h4[contains(@class,'js-plan-price')]" }
  get TOTAL_AMOUNT_LABEL() { return  `div[class*='m-bottom-2']`}
  get SUMMARY_TOTAL_AMOUNT_LABEL() { return  `div[class*='totalPrice-']` }
  get YOUR_SAVINGS_LABEL() { return  `div[class*='totalSaved-']` }
  get SERVER_STATUS_LABEL() { return  `(//*[@class='actionsalt server-name'])[2]` } 
  get ORDER_SUMMARY_LABEL() { return  `div[class*='add-dedicated__order-summary']` }
  get CPU_CORES_LABEL () { return  "order-summary__line-items li:first-child" }
  get RAM_LABEL () { return  "order-summary__line-items li:second-child" }
  get ORDER_SUMMARY_PLAN_NAME_LABEL () { return  "h3.t-1.m-top-0.t-c-b300.t-body.t-bold.m-bottom-0" }
  get ORDER_SUMMARY_CPU_CORES_LABEL () { return  "ul.order-summary__line-items>li:nth-of-type(1)>ul" }
  get ORDER_SUMMARY_RAM_LABEL () { return  "ul.order-summary__line-items>li:nth-of-type(2)>ul" }
  get ORDER_SUMMARY_STORAGE_LABEL () { return  "ul.order-summary__line-items>li:nth-of-type(3)>ul" }
  get ORDER_SUMMARY_IMAGE_LABEL () { return  "ul.order-summary__line-items>li:nth-of-type(4)>ul" }
  get ORDER_SUMMARY_PRODUCT_COUNT_LABEL () { return  'div[class^="productCount-"]' }
  get ORDER_SUMMARY_YOUR_SAVINGS_LABEL () { return  'div[class^="totalSaved-"]>div[class^="price-"]' }
  get ORDER_SUMMARY_TOTAL_LABEL () { return  'div[class^="totalPrice-"]>div[class^="price-"]' }
  get CART_PRODUCT_NAME_LABEL () { return  'div[class^="info-"]>div[class^="name-"]' }
  get CART_PRODUCT_PRICE_LABEL () { return  'div[class^="productPrice-"]>div[class^="price-"]' }
  get CART_SELECTED_PLAN_LABEL () { return  '(//div[contains(@class,"selectedValue-")])[1]' }
  get CART_SELECTED_TERM_LABEL () { return  '(//div[contains(@class,"selectedValue-")])[2]' }
  get CORES_OPTIONS_LABEL () { return  'ul.server-config__options.cores>li>a.active' }
  get DISK_OPTIONS_LABEL () { return  'ul.server-config__options.disk>li>a.active' }
  get RAM_OPTIONS_LABEL () { return  'ul.server-config__options.ram>li>a.active' }
  get DBOARD_NAME_LABEL () { return  'tr[id^="machine_row_dedipreorder_"]>td.server-name' }
  get DBOARD_RAM_LABEL () { return  'tr[id^="machine_row_dedipreorder_"]>td:nth-of-type(3)>div:nth-of-type(1)' }
  get DBOARD_DISK_LABEL () { return  'tr[id^="machine_row_dedipreorder_"]>td:nth-of-type(3)>div:nth-of-type(2)' }
  get DBOARD_ACTIONS_LABEL () { return  'tr[id^="machine_row_dedipreorder_"]>td.actions>a' }
  

  // Modal

  // Group Labels

  // Inputs

  // Buttons
  get ADD_A_DEDICATED_SERVER_BUTTON () { return  `a.Button.Button--primary.Button--hero.Button--block` }
  get ADD_SERVER_BUTTON () { return  "//input[@value='Add Server']" }
  get ADD_OR_CHANGE_A_DEDICATED_SERVER_BUTTON() { return  `//*[contains(@class,'buttonbig')]`}
  get BACK_BUTTON() { return  `button[class*='back-']`}
  get CANCEL_DEFAULT_BUTTON() { return  `button.Button.Button--default:not(.Site-Icon-Button)`}
  get CANCEL_ORDER_BUTTON () { return  `(//*[contains(@class,'icon-close4')])[2]` }
  get CANCEL_BUTTON () { return  "//div[contains(@class,'Flex-Row__m')]/button"}
  get CHECKOUT_NOW_BUTTON () { return  `//*[contains(@class,'dedi_submit')]`}
  get CLOSE_ALERT_BUTTON() { return  "button.Alert__button"}
  get FOUR_GB_RAM_BUTTON () { return  `ul.server-config__options.ram>li:nth-of-type(1)>a` }
  get EIGHT_GB_RAM_BUTTON () { return  `(//*[contains(@class,'ram')]/descendant::a)[2]` }
  get SIXTEEN_GB_RAM_BUTTON () { return  `(//*[contains(@class,'ram')]/descendant::a)[3]` }
  get THIRTY_TWO_GB_RAM_BUTTON () { return  `(//*[contains(@class,'ram')]/descendant::a)[4]` }
  get SIXTY_FOUR_GB_RAM_BUTTON () { return  `(//*[contains(@class,'ram')]/descendant::a)[5]` }
  get MONTHLY_BILLING_PLAN_BUTTON () { return  "ul.server-config__options.plan li:first-child" }
  get ORDER_SUMMARY_BILLING_PLAN_BUTTON () { return  "ul.server-config__options.plan>li.plan-price__selected" }
  get ONE_TB_HDD_BUTTON () { return  `ul.server-config__options.disk>li:nth-of-type(1)>a` }
  get TWO_TB_HDD_BUTTON () { return  `(//*[contains(@class,'disk')]/descendant::a)[2]` }
  get TWO_HUNDRED_FOURTY_GB_SSD_BUTTON () { return  `(//*[contains(@class,'disk')]/descendant::a)[3]` }
  get SUBMIT_ORDER_BUTTON () { return  `button[class*="submitOrder-"]` }
  get XEON_4_CORE_BUTTON () { return  `ul.server-config__options.cores>li:nth-of-type(1)>a` }
  get XEON_12_CORE_BUTTON () { return  `(//div[@class='the-core'])[2]/parent::a` }
  get YEARLY_BILLING_PLAN_BUTTON () { return  "ul.server-config__options.plan li:last-child" }
  
  
  
  // Checkboxes

  // Links
  get DASHBOARD() { return  `//*[@id='tracking_nav_dedicated_dashboard']` }

  // List
  get PLAN_PRICE_SELECTED () { return  `//*[contains(@class,'plan-price__selected')]/a`}

  // Table

  // Progress Bar

  /**
     * Click Available Price of Specific Domain
     *
     * @param domain
     */
}


