import { Page, expect } from '@playwright/test';
import Base from '../base.po';

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
  /* ======================================================================= */
  /* ============================== Functions ============================== */
  /* ======================================================================= */

}