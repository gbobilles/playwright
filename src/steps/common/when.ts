import { When } from '@cucumber/cucumber';
import { ICustomWorld } from '../../support/custom-world';
import { Pages } from '../../page_objects/map.po'
import BasePage from '../../page_objects/base.po'
import { Locator } from '@playwright/test';
import { ValidPageClasses } from '../../types/pages';


When(/^I click "([^"]*)?"."([^"]*)?"$/,
  async function (this: ICustomWorld, pageClass: ValidPageClasses, selectorName: string) {
    const page = this.page!;
    const obj = new Pages[pageClass](page)

    let selector: Locator | string = obj[selectorName]

    await obj.base.click(selector)
  })


When("I set context value of {string} as {string}", async function (this: ICustomWorld, key: string, value: string) {
  this.parameters[key] = value

  console.log('WhenXXX: ' + this.parameters[key])
})

When("I set value {string} to element {string}.{string}",
  async function (this: ICustomWorld, value: string, pageClass: ValidPageClasses, selectorName: string) {
    const page = this.page!
    const obj = new Pages[pageClass](page)

    let selector: Locator | string = obj[selectorName]

    await obj.base.setValue(selector, value)
  })

When(/^I hover to "([^"]*)?"."([^"]*)?"$/,
  async function (this: ICustomWorld, pageClass: ValidPageClasses, selectorName: string) {
    const page = this.page!
    const obj = new Pages[pageClass](page)

    let selector: Locator | string = obj[selectorName];

    await obj.base.hover(selector)
  })