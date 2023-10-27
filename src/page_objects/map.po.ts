import DiskSummary from '../page_objects/billing_account/disk_summary.po';
import FileManager from '../page_objects/file_manager/file_manager.po'
import Header from '../page_objects/common_sections/header.po';
import LeftPanel from '../page_objects/common_sections/leftpanel.po';
import SFTPUserFiles from '../page_objects/sftp_user_files/sftp.po';
import DedicatedServer from '../page_objects/add_product/dedicated_server.po';


export const Pages: {
  DiskSummary: typeof DiskSummary
  FileManager: typeof FileManager
  Header: typeof Header
  LeftPanel: typeof LeftPanel
  SFTPUserFiles: typeof SFTPUserFiles
  DedicatedServer: typeof DedicatedServer
} = {

  // Billing Account
  DiskSummary,

  // Common Sections
  DedicatedServer,
  Header,
  LeftPanel,

  // User Management
  SFTPUserFiles,
  FileManager,

};
