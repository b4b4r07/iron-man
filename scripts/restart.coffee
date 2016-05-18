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

module.exports = (robot) ->
    robot.respond /restart\s*(now|please)?/i, (res) ->
        user = {stage: 1}
        name = res.message.user.name.toLowerCase()
        robot.brain.set name, user
        res.send "Are you sure (y/n) ?"
        robot.hear /(\w+)/i, (msg) ->
            name = msg.message.user.name.toLowerCase()
            user = robot.brain.get(name) or null
            if user != null
                answer = msg.match[1]
                if /y(es)?/i.test(answer)
                    msg.send "Rebooting..."
                    @exec = require('child_process').exec
                    @exec "./slack.sh restart", (error, stdout, stderr) ->
                        msg.send error if error?
                        msg.send stdout if stdout?
                        msg.send stderr if stderr?
                    robot.brain.remove name
                else if /n(o)?/i.test(answer)
                    msg.send "Aborted!"
                    robot.brain.remove name
                else
                    msg.send "yes or no"
