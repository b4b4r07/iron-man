module.exports = (robot) ->
  robot.hear /アイアンマン|iron-?man/i, (msg) ->
    msg.send 'I am Iron Man!!'
