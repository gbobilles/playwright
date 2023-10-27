import { transports, format } from 'winston'
const JOB_ID = (!process.env.JOB_ID || process.env.JOB_ID === '')
  ? ''
  : '/' + process.env.JOB_ID

export const options = (scenarioName: string) => {
  return {
    transports: [
      new transports.File({
        filename: `reports${JOB_ID}/logs/${scenarioName}.log`,
        level: 'info',
        format: format.combine(
          format.timestamp({ format: 'MMM-DD-YYYY HH:mm:ss' }),
          format.align(),
          format.printf(info => `${info.level}: ${[info.timestamp]}: ${info.message}`)
        )
      })
    ]
  }
}