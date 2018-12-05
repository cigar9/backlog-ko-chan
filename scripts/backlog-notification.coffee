# Description:
#   Backlog to Slack
#
# Commands:
#   None

backlogUrl = 'https://reclick.backlog.jp/'

module.exports = (robot) ->
  robot.router.post "/test/:room", (req, res) ->
    { room } = req.params
    { body } = req
    try
      switch body.type
        when 1
          label = '課題を追加'
        when 2, 3
          label = '課題を更新'
        when 5
          label = 'wikiを追加'
        when 6
          label = 'wikiを更新'
        when 8
          label = 'ファイルを追加'
        when 9
          label = 'ファイルを更新'
        else

      url = "#{backlogUrl}view/#{body.project.projectKey}-#{body.content.key_id}"
      if body.content.comment?.id?
        url += "#comment-#{body.content.comment.id}"

      message = "*Backlog #{label}*\n"
      message += "[#{body.project.projectKey}-#{body.content.key_id}] - "

      # ここでチケットを作った作成者のユーザ名がbyの後ろについてしまい、知らせたい人じゃない人にメンションが飛んでしまいがち
      # message += "#{body.content.summary} _by #{body.createdUser.name}_\n>>> "
      message += "#{body.content.summary}"

      # notificatonに通知したい人がいればその名前をメンションしてくれる
      if body.notifications.length > 0
        message += "_to "
        for a in body.notifications
          console.log a.user.name
          message += "#{a.user.name} "

      if body.content.comment?.content?
        message += "#{body.content.comment.content}\n"
      message += "#{url}"

      if message?
        robot.messageRoom room, message
        res.end "OK"
      else
        robot.messageRoom room, "Backlogのデータがなんか取れないです。"
        res.end "Error"
        
    catch error
      robot.send
      res.end "Error"
