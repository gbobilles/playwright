import { Locator } from "@playwright/test";

interface PageClasses {
  DiskSummary: "DiskSummary";
  FileManager: "FileManager";
  Header: "Header";
  LeftPanel: "LeftPanel";
  SFTPUserFiles: "SFTPUserFiles";
}


export type ValidPageClasses = keyof PageClasses