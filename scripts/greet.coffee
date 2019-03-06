require('newrelic')
require('dotenv')

answer = process.env.MESSAGE

module.exports = (robot) ->
  robot.respond /おはよう/i, (msg) ->
    msg.send "おはようございます！　あと#{answer}"
