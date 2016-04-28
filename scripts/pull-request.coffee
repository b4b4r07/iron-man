module.exports = (robot) ->
  robot.hear /(#[0-9]+)/i, (msg) ->
    msg.send "https://github.com/b4b4r07/zplug/issues/#{msg.match[1].replace(/^#/, '')}"
