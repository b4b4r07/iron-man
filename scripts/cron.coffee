cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 10 11 * * 1-5', () =>
    robot.send {room: "#zp-b4b4r07"}, "������������"
  , null, true, "Asia/Tokyo"
