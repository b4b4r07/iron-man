# Description:
#   Restart bot
#
# Configuration:
#   None
#
# Commands:
#   hubot update
#
# Author:
#   b4b4r07 <b4b4r07@gmail.com>

sh = (msg, command) ->
    @exec = require('child_process').exec
    @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr

module.exports = (robot) ->
    robot.respond /(.*)のリンク/i, (msg) ->
        sh(msg, "./helpers/link.sh #{msg.match[1]}")
