export { }

declare global {
  namespace NodeJS {
    interface ProcessEnv {
      BROWSER: "chrome" | "firefox" | "webkit",
      APP_ENV: "STAGING" | "PROD" | "PREPROD" | "DEVELOP" | "STAGING_INTERNAL",
      BASEURL: string,
      HEADLESS: "true" | "false",

      FTP_PASSWORD?: string,
    }
  }
}