import { Page } from '@playwright/test';
import { ICustomWorld } from '../../support/custom-world'
import Base from '../base.po';

export default class FileManager {

  [linkName: string]: any;

  public base: Base;

  constructor(private page: Page) {
    this.base = new Base(page)
  }

  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  // Labels
  get LOGIN_LABEL() { return `h4#modal-login-label` }
  get SFTP_USER_LABEL() { return `#breadcrumb-ol > li:nth-of-type(3) > a` }

  // Form Fields
  get HOST_TEXTFIELD() { return `input[ng-model="configuration.sftp.host"]` }
  get USERNAME_TEXTFIELD() { return `input[ng-model="configuration.sftp.remoteUsername"]` }
  get AUTHENTICATION_TYPE_DROPDOWN() { return `select[ng-model="configuration.sftp.authenticationModeName"]` }
  get PASSWORD_TEXTFIELD() { return `input[ng-model="configuration.sftp.password"]` }

  // Buttons

  get CONNECT_BUTTON() { return `button[ng-click="connect()"]` }

  /* ======================================================================= */
  /* ============================== Functions ============================== */
  /* ======================================================================= */

  async loginToFileManager(username: string, hostname: string) {
    await this.base.waitForPageToLoad()

    const loginLabel = this.base.isLocator(this.LOGIN_LABEL) ? this.LOGIN_LABEL : this.page.locator(this.LOGIN_LABEL)

    if (await loginLabel.isVisible()) {

      // perform login
      await this.base.setValue(this.HOST_TEXTFIELD, hostname)
      await this.base.setValue(this.USERNAME_TEXTFIELD, username)
      await this.page.locator(this.AUTHENTICATION_TYPE_DROPDOWN).selectOption({ label: 'Password' })
      await this.base.setValue(this.PASSWORD_TEXTFIELD, process.env.FTP_PASSWORD ?? 'sftp_automation')
      await this.base.click(this.CONNECT_BUTTON)
    }

  }
}