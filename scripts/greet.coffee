require('newrelic')
require('dotenv')

module.exports = (robot) ->
  robot.respond /おはよう/i, (msg) ->
    msg.send process.env.MESSAGE
