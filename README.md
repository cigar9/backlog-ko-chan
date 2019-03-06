# バックログ子ちゃん
Backlogの課題登録、更新などをSlack等へ投稿するためのHubotアプリ。  
Herokuにデプロイする前提で作られています。

# 必要な設定
Heroku側で環境変数の設定が必要です。  
取得したいBacklogのURLを、`HUBOT_BACKLOG_URL` という変数名で設定してください。
```
HUBOT_BACKLOG_URL　：　https://hogehoge.backlog.jp/
```

Slackへ流す際は下記の設定も必要になると思います。
```
HUBOT_SLACK_BOTNAME　：　slackのHubotアプリの設定で入力したHubotのユーザー名
HUBOT_SLACK_TEAM　：　slackのチーム名
HUBOT_SLACK_TOKEN　：　slackのHubotアプリの設定で取得したAPIトークン
```
