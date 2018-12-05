# Description:
#   Backlog to Slack
#
# Commands:
#   None

backlogUrl = 'https://reclick.backlog.jp/'

module.exports = (robot) ->
  robot.router.post "/test/", (req, res) ->
    { room } = req.params
    { body } = req
    try
      robot.messageRoom room, body
      res.end "OK"


#      switch body.type
#        when 1
#          label = '課題の追加'
#        when 2, 3
#          label = '課題の更新'
#        when 5
#          label = 'wikiの追加'
#        when 6
#          label = 'wikiの更新'
#        when 8
#          label = 'ファイルの追加'
#        when 9
#          label = 'ファイルの更新'
#        else
#
#      url = "#{backlogUrl}view/#{body.project.projectKey}-#{body.content.key_id}"
#      if body.content.comment?.id?
#        url += "#comment-#{body.content.comment.id}"
#
#      message = "*Backlog #{label}*\n"
#      message += "[#{body.project.projectKey}-#{body.content.key_id}] - "
#      message += "#{body.content.summary} _by #{body.createdUser.name}_\n>>> "
#      if body.content.comment?.content?
#        message += "#{body.content.comment.content}\n"
#      message += "#{url}"
#
#      if message?
#        robot.messageRoom room, message
#        res.end "OK"
#      else
#        robot.messageRoom room, "Backlog integration error."
#        res.end "Error"
    catch error
      robot.send
      res.end "Error"
