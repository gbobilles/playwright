import { Page, expect } from '@playwright/test';
import { ICustomWorld } from '../../support/custom-world'
import Base from '../base.po';
import 'dotenv/config'

export default class SFTPUserFiles {

  [linkName: string]: any;

  public base: Base;
  constructor(private page: Page) {
    this.base = new Base(page);
  }

  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  // Labels
  get SEARCHED_USERNAME_LOGIN_INFO() { return `//div[@data-test-id="virtuoso-item-list"]//div[starts-with(@class, 'username-')]/div[starts-with(@class, 'name-')]` }
  get SEARCHED_HOSTNAME_LOGIN_INFO() { return `input[name="host_name"]` }
  get HOST_TOOLTIP_ICON() { return `[name="host_name"]  ~ label > div[class^="tooltip"]` }
  get USERNAME_TOOLTIP_ICON() { return '[name="user_name"]  ~ label > div[class^=tooltip]' }
  get USERNAME_LABEL() { return `div[class^='username-'] div[class^='name-']` }
  get GROUP_SERVICE_NAME_LABEL() { return 'div[class*="machineBar-"] > div[class*="serviceName-"]' }

  // Buttons
  get CREATE_USER_BUTTON() { return `button[class*='addUserButton-']` }
  get INNER_CREATE_USER_BUTTON() { return `button[class*='newusercreate-']` }
  get SFTP_CONTEXT_MENU_BUTTON() { return `div[class^='usermoreactions-'] > button` }
  get DELETE_BUTTON() { return `div[class*='usermoreactionsdropdown-'] > div:nth-of-type(2)` }
  get CONFIRM_USER_DELETION_BUTTON() { return `button[class*='userconfirmdeletion-']` }
  get CHANGE_PASSWORD_BUTTON() { return `div[class*='changePasswordButton-'] > button` }
  get RESET_PASSWORD_BUTTON() { return `button[class*='userresetpassword-']` }
  get FILE_MANAGER_BUTTON() {
    const desktopButton = this.page.locator(`button[class*='fileManagerButton-']`)
    const mobileButton = this.page.locator(`button[class*='fileManagerButtonMobile-']`)

    return desktopButton.or(mobileButton).first()
  }

  get GROUP_BY_USER_BUTTON() { return `div[class^='ungroupedTabButton'] > button` }
  get GROUP_BY_SERVER_BUTTON() { return `div[class^='groupedTabButton'] > button` }
  get DISK_USAGE_BUTTON() { return this.page.locator(`button[class*='userdiskusage-']`).first() }
  get DELETE_SFTP_USER_BUTTON() { return `a[class*='userdeletewebsite-'][class*='deleteButton-']` }
  get ALLOW_INSECURE_CONNECTION_BUTTON() { return this.page.getByText('Allow insecure connections (FTP)', { exact: true }) }
  get DENY_INSECURE_CONNECTION_BUTTON() { return this.page.getByText('Deny insecure connections (FTP)', { exact: true }) }
  get CONFIRM_ENABLE_FTP_BUTTON() { return `button[class*='userenableftp-'][class*='enableButton-']` }
  get LOGIN_INFO_BUTTON() { return this.page.locator(`button[class*='useraccessinfo-'][class*='loginInfoButton-']`).getByText('Login info', { exact: true }).first() }
  get HIDE_INFO_BUTTON() { return this.page.locator(`button[class*='useraccessinfo-'][class*='loginInfoButton-']`).getByText('Hide info', { exact: true }).first() }
  get INSECURE_CONNECTION_INDICATOR_ICON() { return `div[class*='userinsecureftp-'][class*='insecureFtpButton-'] > button` }
  get DISABLE_FTP_CONNECTION_BUTTON() { return `button[class*='usertooltipdisableftp-'][class*='disableButton-']` }
  get DISABLE_FTP_ACCESS_LOGIN_INFO_BUTTON() { return `button[class*='userdisableftp-'][class*='disableButton-']` }


  // Dropdown
  get SFTP_SERVER_DROPDOWN() { return `div[class*='userform-'] > div[class*='selectRow-']` }

  // Form Fields
  get SEARCH_TEXTFIELD() { return 'input[name="search"]' }
  get USERNAME_TEXTFIELD() { return 'input[name="field_user"]' }
  get NEW_PASSWORD_TEXTFIELD() { return `div[class^='createuserwidget-'] input[name="field_password"]` }
  get CHANGE_PASSWORD_TEXTFIELD() { return `div[class^='resetpassword-'] input[name="field_password"]` }

  // Loading Bars
  get IN_LOADING_BAR() { return `#app-users-dashboard div[class^='progress-'][class*='in-']` }
  get OUT_LOADING_BAR() { return `#app-users-dashboard div[class^='progress-'][class*='out-']` }

  /* ======================================================================= */
  /* ============================== Functions ============================== */
  /* ======================================================================= */

  async waitSFTPLoadingToComplete() {
    const default_progres_bar = `#app-users-dashboard div[class^='progress-']:not([class*='in-']):not([class*='out-'])`
    await this.page.waitForLoadState('networkidle')
    await this.page.locator(default_progres_bar).waitFor({
      state: 'attached', timeout: 15 * 1000
    })
  }

  async searchSFTPUser(user: string) {
    const search = this.page.locator(this.SEARCH_TEXTFIELD)
    await this.base.highlight(search)

    await search.fill(user)

    await search.click()

    await this.page.keyboard.press('Enter')

    await this.waitSFTPLoadingToComplete()

    const userLoginInfoLocator = this.page.locator(this.SEARCHED_USERNAME_LOGIN_INFO)

    await expect(userLoginInfoLocator).toHaveCount(1)
  }

  async customWaitProgress(selector: string, timeout: number = (30 * 1000)) {
    if (selector !== '' && selector !== undefined) {
      const locator = this.page.locator(selector)

      await locator.waitFor({
        state: 'visible',
        timeout: 10 * 1000 // wait for 10 seconds for progress bar to appear
      })

      await locator.waitFor({
        state: 'hidden',
        timeout: timeout
      })
    }
  }
  async waitForSFTPCreationProgress(sftpUser: string = '') {
    const sftpProgressSelector = `//div[contains(@class, 'creatinguserlist-')]//div[starts-with(@class, 'name-')][text()='${sftpUser}']`

    await this.customWaitProgress(sftpProgressSelector, (10 * 60_000)) // wait for 5 minutes
  }

  async waitForSFTPPasswordUpdateProgress(sftpUser: string = '') {
    const progressSelector = `//div[starts-with(@class, 'name-')][text()='${sftpUser}']/ancestor::div[contains(@class, 'summary-')]/following-sibling::div`

    await this.customWaitProgress(progressSelector, (10 * 60_000)) // wait for 5 minutes
  }

  async waitForSFTPConnectionUpdateProgress(sftpUser: string) {
    const progressSelector = `//div[starts-with(@class, 'name-')][text()='${sftpUser}']/ancestor::div[contains(@class, 'summary-')]/following-sibling::div`

    await this.customWaitProgress(progressSelector, 10 * 60_000) // wait for 10 minutes
  }

  async createSFTPUser(username: string, enableSSH: boolean = false, server: string = 'Shared Unlimited') {
    await this.base.click(this.CREATE_USER_BUTTON)
    await this.base.setValue(this.USERNAME_TEXTFIELD, username)
    await this.base.click(this.SFTP_SERVER_DROPDOWN)
    const serverSelector = `//div[contains(@class, 'optionsWrapper-')]//div[contains(@class, 'serviceName-')][text()='${server}']`
    await this.base.click(serverSelector)
    await this.base.setValue(this.NEW_PASSWORD_TEXTFIELD, process.env.FTP_PASSWORD ?? 'sftp_automation')

    if (enableSSH) {
      const sshToggleSelector = `div[class*='secureShellToggle-'] div[class*='switch-']`
      await this.base.click(sshToggleSelector)
    }
    await this.base.click(this.INNER_CREATE_USER_BUTTON)

    await this.waitForSFTPCreationProgress(username)
  }

  async deleteSFTPUser(username: string) {
    await this.searchSFTPUser(username)

    await this.base.click(this.SFTP_CONTEXT_MENU_BUTTON)
    await this.base.click(this.DELETE_BUTTON)
    await this.base.click(this.CONFIRM_USER_DELETION_BUTTON)

    await this.page.getByText('Success! User has been deleted.', { exact: true }).waitFor({
      state: 'visible',
      timeout: 10 * 1000
    })
  }

  async resetSFTPUser(action: "add" | "delete", sftpUser: string, world?: ICustomWorld) {
    if (action === 'delete') {
      const dynamicSftpUser = `${sftpUser}_${Date.now()}`
      console.log('Created User: ' + dynamicSftpUser)
      world!.parameters[sftpUser] = dynamicSftpUser
      await this.createSFTPUser(dynamicSftpUser)
    } else {
    }
  }

  async addDeleteSFTPUser(action: "add" | "delete", sftpUser: string, world?: ICustomWorld) {
    await this.resetSFTPUser(action, sftpUser, world)

    if (action === 'add') {
      await this.createSFTPUser(sftpUser)
    } else {
      const userToDelete = world!.parameters[sftpUser]
      console.log('User to delete: ' + userToDelete)
      await this.deleteSFTPUser(userToDelete)
    }
  }

  async disableSFTP(sftpUser: string) {

    await this.base.click(this.ALLOW_INSECURE_CONNECTION_BUTTON)
    await this.base.click(this.CONFIRM_ENABLE_FTP_BUTTON)
    await this.waitForSFTPConnectionUpdateProgress(sftpUser)
  }

  async enableSFTP(sftpUser: string) {
    await this.base.click(this.DENY_INSECURE_CONNECTION_BUTTON)
    await this.waitForSFTPConnectionUpdateProgress(sftpUser)
  }

  async disableInsecureConnectionThruWarningIndicator(sftpUser: string) {

    await this.base.click(this.HIDE_INFO_BUTTON)

    const isInsecureBtnVisible = await this.base.isVisible(this.INSECURE_CONNECTION_INDICATOR_ICON)

    if (!isInsecureBtnVisible) {
      await this.disableSFTP(sftpUser)
    }

    await this.base.hover(this.INSECURE_CONNECTION_INDICATOR_ICON)

    await this.base.click(this.DISABLE_FTP_CONNECTION_BUTTON, true)

    await this.waitForSFTPConnectionUpdateProgress(sftpUser)

    const isHideInfoBtnVisible = await this.base.isVisible(this.HIDE_INFO_BUTTON)

    if (isHideInfoBtnVisible) {
      await this.base.click(this.HIDE_INFO_BUTTON)
    }
  }

  async setFTPInsecureConnectionThruHamburgerMenu(action: "enable" | "disable", sftpUser: string) {
    await this.base.click(this.SFTP_CONTEXT_MENU_BUTTON)

    // For reset
    if (action === 'enable') {
      if (await this.base.isVisible(this.DENY_INSECURE_CONNECTION_BUTTON)) {
        await this.enableSFTP(sftpUser)
        await this.base.click(this.SFTP_CONTEXT_MENU_BUTTON)
      }
      await this.disableSFTP(sftpUser)
    } else {
      if (await this.base.isVisible(this.ALLOW_INSECURE_CONNECTION_BUTTON)) {
        await this.disableSFTP(sftpUser)
        await this.base.click(this.SFTP_CONTEXT_MENU_BUTTON)
      }
      await this.enableSFTP(sftpUser)
    }

    const isHideInfoBtnVisible = await this.base.isVisible(this.HIDE_INFO_BUTTON)

    if (isHideInfoBtnVisible) {
      await this.base.click(this.HIDE_INFO_BUTTON)
    }
  }

  async disableFTPInsecureThruLoginInfo(sftpUser: string) {
    const isLoginInfoVisible = await this.base.isVisible(this.LOGIN_INFO_BUTTON)

    if (isLoginInfoVisible) {
      await this.base.click(this.LOGIN_INFO_BUTTON) // Click login info button
    }

    const isDisableFTPAccessVisible = await this.base.isVisible(this.DISABLE_FTP_ACCESS_LOGIN_INFO_BUTTON)

    if (!isDisableFTPAccessVisible) {
      await this.base.click(this.SFTP_CONTEXT_MENU_BUTTON)
      await this.disableSFTP(sftpUser)
      if (await this.base.isVisible(this.LOGIN_INFO_BUTTON)) {
        await this.base.click(this.LOGIN_INFO_BUTTON, false, 0, 5_000) // Click login info button
      }
    }

    await this.base.click(this.DISABLE_FTP_ACCESS_LOGIN_INFO_BUTTON)
    await this.waitForSFTPConnectionUpdateProgress(sftpUser)

    if ((await this.base.isVisible(this.HIDE_INFO_BUTTON))) {
      await this.base.click(this.HIDE_INFO_BUTTON)
    }
  }
}

