import { ICustomWorld } from '../../support/custom-world';
import { Locator, Page, expect } from '@playwright/test';
import { Then } from '@cucumber/cucumber';
import { Pages } from '../../page_objects/map.po';
import BasePage from '../../page_objects/base.po';
import { ValidPageClasses } from '../../types/pages';


Then(/^I expect( partial)* text "(.*)?" is( not)* displayed$/,
  async function (this: ICustomWorld, partialMatch: boolean, textOrSelector: string, falseCase: boolean) {
    let page: Page;

    if (this.parameters['isNewPageOpened']) {
      page = this.parameters['newPage']!
    } else {
      page = this.page!
    }
    const base = new BasePage(page)

    let element: Locator

    if (textOrSelector.startsWith('pw:')) {
      textOrSelector = textOrSelector.split('pw:')[1]
      element = page.locator(textOrSelector)
    } else {
      element = page.getByText(textOrSelector, { exact: !partialMatch })
    }

    if (falseCase) {
      await expect(element).not.toBeVisible({ timeout: 30 * 1000 })
    } else {
      await expect(element).toBeVisible({ timeout: 30 * 1000 })
    }
    await base.highlight(element)
  })



Then(/^I expect element "([^"]*)?"."([^"]*)?" is( not)* displayed$/,
  async function (this: ICustomWorld, pageClass: ValidPageClasses, selectorName: string, falseCase: boolean) {
    const page = this.page!;
    const obj = new Pages[pageClass](page)

    const selector: Locator | string = obj[selectorName]
    const element = obj.base.isLocator(selector) ? selector : page.locator(selector)

    if (falseCase) {
      await expect(element).not.toBeVisible({ timeout: 30_000 })
    } else {
      await expect(element).toBeVisible({ timeout: 30_000 })
    }
  })

Then("I expect context value of {string} is equal to {string}",
  async function (this: ICustomWorld, key: string, value: string) {
    const contextValue = this.parameters[key]
    expect(contextValue).toEqual(value)
  })

Then(
  /^I expect element "([^"]*)?"."([^"]*)?"( does not)* contain(s)? (text|value) "([^"]*)?"$/,
  async function (this: ICustomWorld, pageClass: ValidPageClasses, selectorName: string, falseCase: boolean,
    plural: string, textOrValue: "text" | "value", text: string) {

    let page: Page;

    if (this.parameters['isNewPageOpened']) {
      page = this.parameters['newPage']!
    } else {
      page = this.page!
    }

    const obj = new Pages[pageClass](page)

    const typeToCheck = textOrValue === 'text' ? 'toHaveText' : 'toHaveValue'

    const selector: Locator | string = obj[selectorName]
    const element = obj.base.isLocator(selector) ? selector : page.locator(selector)

    if (falseCase) {
      await expect(element).not[typeToCheck](text, { timeout: 30 * 1000 })
    } else {
      await expect(element)[typeToCheck](text, { timeout: 30 * 1000 })
    }
    await obj.base.highlight(element)
  }
);

Then(/^I expect element "([^"]*)?"."([^"]*)?"( does not)* exists$/,
  async function (this: ICustomWorld, pageClass: ValidPageClasses, selectorName: string, falseCase: boolean) {

    let page: Page;

    if (this.parameters['isNewPageOpened']) {
      page = this.parameters['newPage']!
    } else {
      page = this.page!
    }

    const obj = new Pages[pageClass](page)

    const locator: Locator | string = obj[selectorName]

    const element = obj.base.isLocator(locator) ? locator : page.locator(locator)
    const elementCount = await element.count()

    if (falseCase) {
      await expect(() => {
        expect(elementCount).toBe(0)
      }).toPass({ timeout: 30_000 })
    } else {
      await expect(() => {
        expect(elementCount).toBeGreaterThanOrEqual(1)
      }).toPass({ timeout: 30_000 })
    }
  })