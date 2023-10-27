import { ICustomWorld } from '../../support/custom-world';
import { Given } from '@cucumber/cucumber';
import { Pages } from '../../page_objects/map.po';
import { Environment } from '../../types/test'
import { URLS } from '../../constants/url'
import 'dotenv/config';

const HeaderInstance = Pages.Header;
const LeftPanelInstance = Pages.LeftPanel;

Given(/^I navigate to( PREPROD| STAGING| STAGING_INTERNAL| DEVELOP| PROD)* DHWEBPANEL$/, async function (this: ICustomWorld, environment: Environment) {
  const page = this.page!;
  // const header = new HeaderInstance(page);

  // try {
  const envUrl = !environment ? (process.env.APP_ENV || 'PREPROD') : environment
  const url = URLS[envUrl].BASE
  await page.goto(
    `${url}/dhwebpanel/index.cgi?tree=home.over#!/welcome/`,
    { timeout: 2 * 60_000 } // 2 minute wait
  );

  await page.waitForLoadState('domcontentloaded', { timeout: 60 * 1000 });

  // await header.closeNotificationModal();

  this.logger?.info('Navigate to DH Webpanel')

  //   await page.evaluate((_) => { },
  //     `browserstack_executor: ${JSON.stringify({ action: "setSessionStatus", arguments: { status: "passed", reason: "success" } })}`);
  // } catch (error) {
  //   await page.evaluate((_) => { },
  //     `browserstack_executor: ${JSON.stringify({ action: "setSessionStatus", arguments: { status: "failed", reason: error } })}`);
  // }

});


Given("I login with username {string}", async function (this: ICustomWorld, username: string) {
  const page = this.page!;

  const header = new HeaderInstance(page);

  // const envUrl = process.env.APP_ENV || 'PREPROD'
  // const url = URLS[envUrl].BASE
  // // await page.goto(`${url}/dhwebpanel/`);

  let password: string
  if (process.env[`dh_${username}`]) {
    password = process.env[`dh_${username}`]!
  } else {
    password = process.env.AUTOMATION_PASSWORD ?? 'automation_pass123'
  }

  const usernameField = page.getByPlaceholder('Email')
  const passwordField = page.getByPlaceholder('Password')
  const signInBtn = page.getByRole('button', { name: 'Sign In', exact: true })

  await header.base.setValue(usernameField, username)
  await header.base.setValue(passwordField, password)
  await header.base.click(signInBtn)

  await page.waitForLoadState('domcontentloaded', { timeout: 60 * 1000 })

  await header.closeNotificationModal();
})

/**
 * Setup Fixture authentication 
 */
Given('I setup auth for webid {string}',
  async function (this: ICustomWorld, webid: string) {

    const page = this.page!;
    const header = new HeaderInstance(page);

    const envUrl = process.env.APP_ENV || 'PREPROD'
    const url = URLS[envUrl].BASE
    await page.goto(`${url}/dhwebpanel/`);

    let password: string
    if (process.env[`dh_${webid}`]) {
      password = process.env[`dh_${webid}`]!
    } else {
      password = process.env.AUTOMATION_PASSWORD ?? 'automation_pass123'
    }
    console.log(`Password: ${password}`)
    await page.getByPlaceholder('Email').fill(webid);
    await page
      .getByPlaceholder('Password')
      .fill(password);
    await page.getByRole('button', { name: 'Sign In', exact: true }).click();

    await page.waitForURL(/.*index\.cgi.*/);

    await page.waitForLoadState('domcontentloaded')
    await page.waitForLoadState('networkidle')

    await page.context().storageState({ path: `playwright/.auth/${webid}.json` });

    // console.log(storageStateData)

    // await header.closeNotificationModal();

    // await header.logout()
  });


/**
 * Left Panel Navigation
 */
Given('I navigate to left panel {string}',
  async function (this: ICustomWorld, linkName: string) {
    const page = this.page!;

    const leftPanel = new LeftPanelInstance(page);

    await leftPanel.leftPanelNavigate(linkName);

    this.logger?.info(`Left panel selection: "${linkName}"`)
  },
);
