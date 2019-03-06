require('newrelic')
require('dotenv')

answer = process.env.HUBOT_MESSAGE

module.exports = (robot) ->
  robot.respond /おはよう/i, (msg) ->
    msg.send "おはようございます！　あと#{answer}"
