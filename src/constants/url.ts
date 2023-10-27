interface URLContent {
  BASE: string
}

interface URL {
  PREPROD: URLContent
  STAGING: URLContent
  STAGING_INTERNAL: URLContent
  DEVELOP: URLContent
  PROD: URLContent
}

export const URLS: URL = {

  PREPROD: {
    BASE: 'https://preprod.proddb.dreamhost.io',
  },

  STAGING: {
    BASE: 'https://staging.proddb.dreamhost.io',
  },

  STAGING_INTERNAL: {
    BASE: 'https://staging-internal.proddb.dreamhost.io'
  },

  DEVELOP: {
    BASE: 'https://staging.proddb.dreamhost.io',
  },

  PROD: {
    BASE: 'https://panel.dreamhost.com',
  }
}