import { ICustomWorld } from './custom-world';
import { config } from './config';
import { Before, After, BeforeAll, AfterAll, Status, setDefaultTimeout, AfterStep } from '@cucumber/cucumber';
import {
  chromium,
  ChromiumBrowser,
  firefox,
  FirefoxBrowser,
  webkit,
  WebKitBrowser,
  ConsoleMessage,
  request,
  Page,
} from '@playwright/test';
import { ITestCaseHookParameter, ITestStepHookParameter } from '@cucumber/cucumber/lib/support_code_library_builder/types';
import { ensureDir } from 'fs-extra';
import { readFile } from 'fs/promises';
import { PickleTag } from '@cucumber/messages';
import fs from 'fs-extra'
import { createLogger } from 'winston'
import { options } from '../support/logger'
import BrowserStackLocal = require("browserstack-local")
import { promisify } from 'util'

const bsLocal = new BrowserStackLocal.Local();
const BS_LOCAL_ARGS = process.env.BROWSERSTACK_ACCESS_KEY || "ACCESSKEY";

const redColour = "\x1b[31m";
const whiteColour = "\x1b[0m";
const sleep = promisify(setTimeout);
const JOB_ID = (!process.env.JOB_ID || process.env.JOB_ID === '')
  ? ''
  : '/' + process.env.JOB_ID;

const PIPELINE_ID = (!process.env.PIPELINE_ID || process.env.PIPELINE_ID === '')
  ? ''
  : ('/' + process.env.PIPELINE_ID);

let browser: ChromiumBrowser | FirefoxBrowser | WebKitBrowser;
const tracesDir = 'traces';

declare global {
  // eslint-disable-next-line no-var
  var browser: ChromiumBrowser | FirefoxBrowser | WebKitBrowser;
}

// setDefaultTimeout(process.env.PWDEBUG ? -1 : 60 * 1000);
setDefaultTimeout(5 * 60 * 1000); // 5 minutes

BeforeAll(async function () {
  const caps = {
    os: "Windows",
    osVersion: 11,
    browserName: "edge",
    browserVersion: "latest",
    name: "NAT",
    build: "User Management",
    buildIdentifier: '#${BUILD_NUMBER}',
    "test_observability": true,
    "observability": true,
    "testObservability": true,
    "browserstack.testObservability": true,
    "browserstack.observability": true,
    "browserstack.test_observability": true,
    "browserstack.username": process.env.BROWSERSTACK_USERNAME,
    "browserstack.accessKey": process.env.BROWSERSTACK_ACCESS_KEY,
    "browserstack.local": process.env.BROWSERSTACK_LOCAL || true,
  };
  const endpoint = `wss://cdp.browserstack.com/playwright?caps=` +
    `${encodeURIComponent(JSON.stringify(caps))}`

  // console.log(endpoint)

  // if (process.env.BROWSERSTACK_LOCAL === "true") {
  //   console.log("Starting BrowserStackLocal ...");
  //   // Starts the Local instance with the required arguments
  //   let localResponseReceived = false;
  //   bsLocal.start({ key: BS_LOCAL_ARGS }, (err) => {
  //     if (err) {
  //       console.error(
  //         `${redColour}Error starting BrowserStackLocal${whiteColour}`
  //       );
  //     } else {
  //       console.log("BrowserStackLocal Started");
  //     }
  //     localResponseReceived = true;
  //   });
  //   while (!localResponseReceived) {
  //     await sleep(1000);
  //   }
  // } else {
  //   console.log("Skipping BrowserStackLocal...");
  // }
  switch (config.browser) {
    case 'firefox':
      browser = await firefox.launch(config.browserOptions);
      break;
    case 'webkit':
      browser = await webkit.launch(config.browserOptions);
      break;
    default:
      // browser = await chromium.connect({
      //   wsEndpoint: endpoint
      // })
      browser = await chromium.launch(config.browserOptions);
  }

  await ensureDir(tracesDir);
  await fs.remove('screenshots/');
});

Before({ tags: '@ignore' }, async function () {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  return 'skipped' as any;
});

Before({ tags: '@debug' }, async function (this: ICustomWorld) {
  this.debug = true;
});

async function getStorageState(tags: readonly PickleTag[]) {
  const isAuthTagExists = tags.some((item) => item.name.includes('@auth'));

  if (isAuthTagExists) {
    const fullAuthTag = tags.find((item) => item.name.includes('@auth'));
    let authTagName = fullAuthTag!.name;
    authTagName = authTagName.split('-')[1];
    console.log('retrieving auth details for ' + authTagName)
    return JSON.parse(await readFile(`playwright/.auth/${authTagName}.json`, 'utf-8'));
  }
}

Before(async function (this: ICustomWorld, { pickle }: ITestCaseHookParameter) {
  await updateTestSummaryCount('addTestTotal');
  this.startTime = new Date();
  this.testName = pickle.name.replace(/\W/g, '-');
  // customize the [browser context](https://playwright.dev/docs/next/api/class-browser#browsernewcontextoptions)

  this.context = await browser.newContext({
    // storageState: await getStorageState(pickle.tags),
    recordVideo: process.env.PWVIDEO ? { dir: 'screenshots' } : undefined,
    viewport: { width: 1600, height: 1200 },
    // viewport: { width: 1400, height: 900 },
  });
  this.server = await request.newContext({
    // All requests we send go to this API endpoint.
    baseURL: config.BASE_API_URL,
  });

  // await this.context.tracing.start({ screenshots: true, snapshots: true });
  this.page = await this.context.newPage();
  // this.page.on('console', async (msg: ConsoleMessage) => {
  //   if (msg.type() === 'log') {
  //     await this.attach(msg.text());
  //   }
  // });
  this.page.setDefaultTimeout(30 * 1000)
  this.feature = pickle;

  const scenarioName = pickle.name + pickle.id;
  this.logger = createLogger(options(scenarioName));
});

AfterStep(async function (this: ICustomWorld, params: ITestStepHookParameter) {
  let page: Page;

  if (this.parameters['isNewPageOpened']) {
    page = this.parameters['newPage']!
  } else {
    page = this.page!
  }
  const image = await page.screenshot()
  image && (await this.attach(image, 'image/png'))
})

After(async function (this: ICustomWorld, { result }: ITestCaseHookParameter) {
  if (result) {
    // await this.attach(`Status: ${result?.status}. Duration:${result.duration?.seconds}s`);

    if (result.status !== Status.PASSED) {
      await updateTestSummaryCount('addTestFail');
      const image = await this.page?.screenshot();

      // Replace : with _ because colons aren't allowed in Windows paths
      // const timePart = this.startTime?.toISOString().split('.')[0].replaceAll(':', '_');

      image && (await this.attach(image, 'image/png'));
      // await this.context?.tracing.stop({
      //   path: `${tracesDir}/${this.testName}-${timePart}trace.zip`,
      // });
    } else {
      await updateTestSummaryCount('addTestPass');
    }
  }

  await this.page?.close();
  await this.context?.close();
});

AfterAll(async function () {
  const name = browser.browserType().name()
  const version = browser.version()
  await generateBrowserMetaData(name, version)

  // Stop the Local instance after your test run is completed, i.e after driver.quit
  // let localStopped = false;

  // if (bsLocal && bsLocal.isRunning()) {
  //   bsLocal.stop(() => {
  //     localStopped = true;
  //     console.log("Stopped BrowserStackLocal");
  //   });
  //   while (!localStopped) {
  //     await sleep(1000);
  //   }
  // }
  await browser.close();
});

async function generateBrowserMetaData(browserName: string, browserVersion: string) {
  const metadata = {
    "browserName": browserName,
    "browserVersion": browserVersion
  }

  await ensureDir(`./metadata`);

  await fs.writeFile(`./metadata${JOB_ID}.json`, JSON.stringify(metadata, null, 2));
}
async function updateTestSummaryCount(action: 'addTestTotal' | 'addTestFail' | 'addTestPass') {

  const PIPELINE_ID = process.env.PIPELINE_ID ?? 'abc';
  const JOB_ID = process.env.JOB_ID ?? '123';

  const api_url = process.env.DH_AUTO_API_URL
  const username = process.env.DH_AUTO_API_USERNAME;
  const password = process.env.DH_AUTO_API_PASSWORD;
  const credentials = `${username}:${password}`;
  const encodedCredentials = Buffer.from(credentials).toString('base64');

  const headers = new Headers({
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': `Basic ${encodedCredentials}`
  });

  const body = {
    "pipeline_id": PIPELINE_ID,
    "job_id": JOB_ID
  };

  const response = await fetch(`${api_url}/api/results/${action}`, {
    method: 'POST',
    headers: headers,
    body: JSON.stringify(body),
  })
  const data = await response.json();
  // console.log(`Report Synced: ${data.message}`);
}