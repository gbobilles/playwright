import { Page, expect } from '@playwright/test';
import { ICustomWorld } from '../../support/custom-world'
import Base from '../base.po';
import 'dotenv/config'

export default class DiskSummary {

  [linkName: string]: any;

  public base: Base;
  constructor(private page: Page) {
    this.base = new Base(page);
  }

  /* ======================================================================= */
  /* ============================== Selectors ============================== */
  /* ======================================================================= */

  // Links
  get RETURN_DISK_SUMMARY_LINK() { return `span.buttonback > a > span` }

  /* ======================================================================= */
  /* ============================== Functions ============================== */
  /* ======================================================================= */

}