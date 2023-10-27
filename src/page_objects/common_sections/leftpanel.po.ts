import { Page } from '@playwright/test';
import Base from '../base.po';

export default class LeftPanel {

  [linkName: string]: any;

  public base: Base;
  constructor(private page: Page) {
    this.base = new Base(page);
  }

  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  // Links
  get HOME_LINK() { return '//a[@id="tracking_nav_home"]/parent::div' }
  get WEBSITES_LINK() { return '//a[@id="tracking_nav_websites"]/parent::div' }
  get DOMAIN_NAMES_LINK() { return '//a[@id="tracking_nav_domain"]/parent::div' }
  get WORDPRESS_LINK() { return '//a[@id="tracking_nav_wordpress_install"]/parent::div' }
  get MAIL_LINK() { return '//a[@id="tracking_nav_mail"]/parent::div' }
  get PRO_SERVICES_LINK() { return "//a[@id='tracking_nav_proservices']/parent::div" }
  get BILLING_ACCOUNT_LINK() { return '//a[@id="tracking_nav_billing"]/parent::div' }
  get SUPPORT_LINK() { return '//a[@id="tracking_nav_support"]/parent::div' }
  get MORE_LINK() { return '//a[@id="tracking_nav_advanced"]/parent::div' }
  get DEDICATED_SERVER_LINK() { return "//a[@id='tracking_nav_dedicated']/parent::div" }
  get VPS_LINK() { return "//a[@id='tracking_nav_vps']/parent::div" }
  get CLOUD_SERVICES_LINK() { return "//a[@id='tracking_nav_cloud']/parent::div" }

  // Websites sublinks
  get MANAGE_WEBSITES_LINK() { return '#tracking_nav_websites_dashboard' }
  get SFTP_USERS_FILES_LINK() { return '#tracking_nav_websites_files' }
  get MYSQL_DATABASES_LINK() { return '#tracking_nav_websites_mysql' }
  get SECURE_CERTIFICATES_LINK() { return '#tracking_nav_websites_secure' }

  // Domain sublinks
  get MANAGE_REGISTRATIONS_LINK() { return '#tracking_nav_domain_registration' }
  get TRANSFER_REGISTRATIONS_LINK() { return '#tracking_nav_domain_transfer' }

  // Wordpress
  get INSTALL_WORDPRESS_LINK() { return '#tracking_nav_wordpress_install_installer' }
  get MANAGED_WORDPRESS_LINK() { return '#tracking_nav_wordpress_install_dreampress' }

  // Billing & Account
  get MANAGE_ACCOUNT_LINK() { return '#tracking_nav_billing_account' }
  get MANAGE_PAYMENTS_LINK() { return '#tracking_nav_billing_payment' }
  get VIEW_INVOICE_LINK() { return '#tracking_nav_billing_invoice' }

  // Support
  get CONTACT_SUPPORT_LINK() { return '#tracking_nav_support_live_chat' }
  get SUPPORT_HISTORY_LINK() { return '#tracking_nav_support_history' }
  get KNOWLEDGE_BASE_LINK() { return '#tracking_nav_support_knowledge_base' }
  get SYSTEM_STATUS_LINK() { return '#tracking_nav_support_status' }
  get DATA_CENTERS_LINK() { return '#tracking_nav_support_dc' }

  // More Section
  get SSH_KEYS_LINK() { return '#tracking_nav_advanced_sshkeys' }
  get CRON_JOBS_LINK() { return '#tracking_nav_advanced_cron' }
  get HTACCESS_WEBDAV_LINK() { return '#tracking_nav_advanced_webdav' }
  get BLOCK_SPIDERS_LINK() { return '#tracking_nav_advanced_robots' }
  get PROXY_LINK() { return '#tracking_nav_advanced_proxy' }
  get SITE_STATISTICS_LINK() { return '#tracking_nav_advanced_stats' }

  // Email Sublinks
  get MANAGE_EMAIL_LINK() { return '#tracking_nav_mail_dashboard' }
  get DISCUSSION_LISTS_LINK() { return '#tracking_nav_mail_discussion' }
  get ANNOUNCE_LISTS_LINK() { return '#tracking_nav_mail_list' }
  get SPAM_FILTERS_LINK() { return '#tracking_nav_mail_junk' }
  get MESSAGE_FILTERS_LINK() { return '#tracking_nav_mail_filters' }
  get CUSTOM_MX_LINK() { return '#tracking_nav_mail_mx' }
  get GOOGLE_WORKSPACE_LINK() { return '#tracking_nav_mail_workspace' }

  // Add Product
  get ADD_DEDICATED_SERVER_LINK () { return "//a[@id='tracking_nav_add_dedicated']" }
  


  // Dedicated Servers Sublinks
  get DASHBOARD_LINK() { return '#tracking_nav_dedicated_dashboard' }
  get ADMIN_USERS_LINK() { return '#tracking_nav_dedicated_usersdashboard' }

  // Buttons
  get HAMBURGER_BUTTON() { return '.burger-menu > .burger-icon-container' }

  /* ======================================================================= */
  /* ============================== Functions ============================== */
  /* ======================================================================= */


  private async clickHamburgerMenu() {
    const element = this.page.locator(this.HAMBURGER_BUTTON);

    if ((await element.isVisible())) {
      await this.page.locator(this.HAMBURGER_BUTTON).click()
    }
  }

  async leftPanelNavigate(linkName: string) {

    await this.clickHamburgerMenu()

    const locator: string = this[`${linkName}_LINK`]

    const menuList = ['HOME', 'WEBSITES', 'DOMAIN_NAMES', 'WORDPRESS', 'MAIL', 'CLOUD_SERVICES', 'DEDICATED_SERVER', 'BILLING_ACCOUNT', 'SUPPORT', 'MORE']

    if (menuList.includes(linkName)) {
      const menu = this.page.locator(locator)
      await menu.waitFor({ state: 'visible' })
      await menu.evaluate(element => element.classList.add("opened"))
    } else {
      await this.base.click(locator)
    }

    await this.base.waitForPageToLoad()
  }
}