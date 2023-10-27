import { Page } from '@playwright/test'
import Base from '../base.po'

export default class LeftPanel {

  [linkName: string]: any;

  public base: Base;
  constructor(private page: Page) {
    this.base = new Base(page);
  }

  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  get PROFILE_NAME_LABEL() { return '.fullname' }
  get EMAIL_ADDRESS_LABEL() { return '.user-email' }

  //links
  get PROFILE_PRIVACY_LINK() { return '#tracking_nav_userlist_profile_info' }
  get BILLING_PAYMENT_LINK() { return '#tracking_nav_userlist_account_info' }
  get SECURITY_LINK() { return '#tracking_nav_secure' }
  get REFERRAL_LINK() { return '#tracking_nav_referrals' }
  get LOGOUT_LINK() { return '#tracking_nav_logout' }

  // Sections
  get SWITCH_LANGUAGE_SECTION() { return `div[class*='flyout-user-menu'] .switch-language .manage-button` }
  get ADMIN_SECTION() { return `//div[@class='title' and text()='Administration']` }
  get USER_EMAIL_SECTION() { return `div[class*='flyout-user-menu'] .user-email` }

  // Language Options
  get ENGLISH_OPTION() { return '#tracking_nav_topnav_language_en > span' }
  get SPANISH_OPTION() { return '#tracking_nav_topnav_language_es > span' }

  // Inputs
  get SWITCH_TO_USER_TEXTINPUT() { return `//input[@type='text' and @class='switch-user-input']` }

  async logout() {
    await this.base.click(this.LOGOUT_LINK)
  }
}