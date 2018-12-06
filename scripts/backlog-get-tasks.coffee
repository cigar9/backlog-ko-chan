Backlog = require "./backlog"
backlog = new Backlog()
request = require "request"

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    name = msg.message.user.name
    msg.send "hello! #{name}"

  #  robot.respond /(.+)の課題$/, (msg) ->
  #    name = msg.match[1]
  #    backlog.getUser(name)
  #      .then (result) ->
  #        backlog.getIssues("statusId": ["1", "2", "3"], "assigneeId": [result])
  #        .then (messages) ->
  #          msg.send messages.join("\n")

  robot.respond /(.+)の課題/, (msg) ->
    name = msg.match[1]
    if name == '自分' || name == 'おれ' || name == '俺' || name == 'オレ' || name == '私' || name == 'わたし' || name == 'ワタシ'
      name = msg.message.user.name
    backlog.getUser(name)
      .then (result) ->
        backlog.getIssues("statusId": ["1", "2", "3"], "assigneeId": [result])
        .then (messages) ->
          msg.send "#{name}さんの課題だよー \n>>>" + messages.join("\n")
    .catch(error) ->
      msg.send "その人は居ないみたい…"
