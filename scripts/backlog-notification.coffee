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
          label = 'に課題が追加されました。'
        when 2, 3
          label = 'の課題が更新されました。'
        when 5
          label = 'にwikiが追加されました。'
        when 6
          label = 'のwikiが更新されました。'
        when 8
          label = 'にファイルを追加されました。'
        when 9
          label = 'のファイルを更新されました。'
        else

      url = "#{backlogUrl}view/#{body.project.projectKey}-#{body.content.key_id}"
      if body.content.comment?.id?
        url += "#comment-#{body.content.comment.id}"

      message = ""

      # notificatonに通知したい人がいればその名前をメンションする
      if body.notifications.length > 0
        for a in body.notifications
          console.log a.user.name
          message += "@#{a.user.name} "

      message += "\n *Backlog#{label}* \n"
      message += "[#{body.project.projectKey}-#{body.content.key_id}] - "

      message += "#{body.content.summary}"

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
