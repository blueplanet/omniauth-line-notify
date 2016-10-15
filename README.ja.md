# OmniAuth::Line::Notify

[英語版 README](https://github.com/blueplanet/omniauth-line-notify/blob/master/README.md)

LINE Notify の OmniAuth .
OAuth 2.0でのサーバーサイド認証フローサポート。他の情報は LINE Notify のドキュメントをご参照ください: https://notify-bot.line.me/static/pdf/line-notify-api_ja.pdf

## インストール

**ワーニング: 今現在（2016/10/15）、 LINE Notify は `uid` を取得できないので、ログイン機能では使えません、ユーザに通知を送るケースだけ使える**

Gemfile に下記の行を追加

```ruby
gem 'omniauth-line-notify'
```

そして下記を実行

    $ bundle

または、手動でインストール

    $ gem install omniauth-line-notify

## 使い方

OmniAuth::Strategies::LineNotify はシンプルなRackミードルウェアである。他の情報は https://github.com/intridea/omniauth を参照ください。

ミードルウェアを Rails アプリケーションに追加する config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
```

または、devise の設定ファイルで追加する

```ruby
config.omniauth :line_notify, ENV['LINE_NOTIFY_CLIEDNT_ID'], ENV['LINE_NOTIFY_APP_SECRET'], scope: 'notify'
```

## 認証のHash情報

認証後の request.env['omniauth.auth'] は下記のようになる。

```ruby
{
  provider: 'line_notify',
  uid: nil,
  info: {},
  credentials: {
    token: 'ABCDEF...', # OAuth 2.0 のアクセストークン
    expires: false
  },
  extra: {}
}
```

## Contributing

バグとアドバイスは GitHub at https://github.com/blueplanet/omniauth-line-notify でお願いします。
