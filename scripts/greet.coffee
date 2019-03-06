require('newrelic')

module.exports = (robot) ->
  robot.respond /おはよう/i, (msg) ->
    msg.send "おはようございます～！"
