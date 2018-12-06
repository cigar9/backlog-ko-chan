Backlog = require "./backlog"
backlog = new Backlog()
request = require "request"

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    name = msg.message.user.name
    msg.send "hello! #{name}"

  robot.respond /(.+)の課題$/, (msg) ->
    name = msg.match[1]
    backlog.getUser(name)
      .then (result) ->
        backlog.getIssues("statusId": ["1", "2", "3"], "assigneeId": [result])
        .then (messages) ->
          msg.send messages.join("\n")
