import { ICustomWorld } from '../support/custom-world'
import { Then, When } from "@cucumber/cucumber";
import { Pages } from '../page_objects/map.po';
import { expect } from '@playwright/test';

const SFTPUserFilesInstance = Pages.SFTPUserFiles

When("I search for SFTP User {string}", async function (this: ICustomWorld, userName: string) {
  const page = this.page!

  const sftp = new SFTPUserFilesInstance(page)

  await sftp.searchSFTPUser(userName)

  const loginInfoBtn = page.getByRole('button', { name: `Login info`, exact: true }).first()

  const isLoginInfoBtnVisible = await sftp.base.isVisible(loginInfoBtn)

  if (isLoginInfoBtnVisible) {
    await loginInfoBtn.click()
  }
})

When(/^I (add|delete) SFTP User "([^"]*)?"$/,
  async function (this: ICustomWorld, action: "add" | "delete", sftpUser: string) {
    const page = this.page!;
    const sftp = new SFTPUserFilesInstance(page);
    const world = this
    await sftp.addDeleteSFTPUser(action, sftpUser, world)
  })

When("I switch to tab Dreamhost File Manager with username {string} and hostname {string}",
  async function (this: ICustomWorld, username: string, hostname: string) {
    const page = this.page!;
    const sftp = new SFTPUserFilesInstance(page)

    const [newPage] = await Promise.all([
      page.waitForEvent('popup'),
      sftp.base.click(sftp.FILE_MANAGER_BUTTON)
    ])

    const fileManager = new Pages.FileManager(newPage)
    await fileManager.loginToFileManager(username, hostname)

    this.parameters['isNewPageOpened'] = true;
    this.parameters['newPage'] = newPage;
  })

When("I switch to tab Billing Disk Usage",
  async function (this: ICustomWorld) {
    const page = this.page!;
    const sftp = new SFTPUserFilesInstance(page)

    const [newPage] = await Promise.all([
      page.waitForEvent('popup'),
      sftp.base.click(sftp.DISK_USAGE_BUTTON)
    ])

    this.parameters['isNewPageOpened'] = true;
    this.parameters['newPage'] = newPage;
  })

When("I wait for SFTP Page to load", async function (this: ICustomWorld) {
  const page = this.page!;
  const sftp = new SFTPUserFilesInstance(page)

  await sftp.waitSFTPLoadingToComplete()
})

When(/^I disable FTP Insecure connection of user "([^"]*)?" thru warning indicator icon$/,
  async function (this: ICustomWorld, sftpUser: string) {
    const page = this.page!
    const sftp = new SFTPUserFilesInstance(page)

    await sftp.disableInsecureConnectionThruWarningIndicator(sftpUser)
  })

When(/^I (enable|disable) FTP Insecure connection of user "([^"]*)?" thru hamburger menu$/,
  async function (this: ICustomWorld, action: "enable" | "disable", sftpUser: string) {
    const page = this.page!
    const sftp = new SFTPUserFilesInstance(page)

    await sftp.setFTPInsecureConnectionThruHamburgerMenu(action, sftpUser)
  })

When("I disable FTP Insecure connection of user {string} thru Login Info",
  async function (this: ICustomWorld, sftpUser: string) {
    const page = this.page!
    const sftp = new SFTPUserFilesInstance(page)

    await sftp.disableFTPInsecureThruLoginInfo(sftpUser)
  })

Then("I expect change password for SFTP User {string} is complete",
  async function (this: ICustomWorld, sftpUser: string) {
    const page = this.page!;
    const sftp = new SFTPUserFilesInstance(page)

    await sftp.waitForSFTPPasswordUpdateProgress(sftpUser)
  })


Then("I expect deleted SFTP User {string} is not displayed",
  async function (this: ICustomWorld, sftpUser: string) {
    const page = this.page!
    const actualSFTPUser = this.parameters[sftpUser]

    const nameLocator = page.locator(`#app-users-dashboard div[data-test-id="virtuoso-item-list"] div[class^='name-']`)
      .filter({ hasText: actualSFTPUser })

    await expect(nameLocator).not.toBeVisible({ timeout: 10 * 1000 })
  })