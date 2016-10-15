# Omniauth::Line::Notify

LINE Notify Strategy for OmniAuth.
Supports OAuth 2.0 server-side flows. Read the LINE Notify docs for more details: https://notify-bot.line.me/static/pdf/line-notify-api.pdf

## Installation

**Warning: Now LINE Notify can`t get the uid, so you can't use the LINE Notify in user login feture, only send notify**

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-line-notify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-line-notify

## Usage

OmniAuth::Strategies::LineNotify is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
```

Or, adding the middleware to Devise in config/initializers/devise.rb:

```ruby
config.omniauth :line_notify, ENV['LINE_NOTIFY_CLIEDNT_ID'], ENV['LINE_NOTIFY_APP_SECRET'], scope: 'notify'
```

## Auth Hash

Here's an example Auth Hash available in request.env['omniauth.auth']:

```ruby
{
  provider: 'line_notify',
  uid: nil,
  info: {},
  credentials: {
    token: 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    expires: false
  },
  extra: {}
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blueplanet/omniauth-line-notify.
