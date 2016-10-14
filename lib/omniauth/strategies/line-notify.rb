require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class LineNotify < OmniAuth::Strategies::OAuth2
      option :name, 'line_notify'

      option :client_options, {:site  => 'https://notify-bot.line.me',
                               :authorize_url => '/oauth/authorize',
                               :token_url     => '/oauth/token',
                               :proxy => ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil}

      uid { raw_info['mid'] }

      info do
        {
          name:        raw_info['displayName'],
          image:       raw_info['pictureUrl'],
          description: raw_info['statusMessage']
        }
      end

      # Require: Access token with PROFILE permission issued.
      def raw_info
        @raw_info ||= JSON.load(access_token.get('v1/profile').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
      
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
