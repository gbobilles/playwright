import { Page } from '@playwright/test';
import Base from '../base.po';
import 'dotenv/config'
import { URLS } from '../../constants/url';
export default class Header {
  public base: Base;
  constructor(private page: Page) {
    this.base = new Base(page);
  }

  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  get NOTIFICATION_SYSTEM_MODAL() {
    return `div.guide-container`;
  }

  get NOTIFICATION_BUTTON() { return '#dreamassistant-bell-portal' }

  get BELLICON_BUTTON() {
    return `div.bell-ghost`;
  }
  get PROFILEICON_BUTTON() { return '.user-menu-icon-container' }
  get LOGOUT_BUTTON() { return 'a#tracking_nav_logout' }
  /* ======================================================================= */
  /* ============================== Functions ============================== */
  /* ======================================================================= */

  async closeNotificationModal() {
    const notifPopup = this.page.locator(this.NOTIFICATION_SYSTEM_MODAL);
    try {
      await notifPopup.waitFor({ state: 'visible', timeout: 30 * 1000 });
    } catch (error) {
      console.log(`Notification Popup modal is not displayed, skipping...`)
    }
    if ((await notifPopup.isVisible())) {
      await this.base.click(this.BELLICON_BUTTON)
      await this.base.click(this.NOTIFICATION_BUTTON)
    }
  }

  async logout() {
    await this.base.click(this.PROFILEICON_BUTTON)
    await this.base.click(this.LOGOUT_BUTTON)
  }
}
