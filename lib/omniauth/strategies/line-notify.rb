require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class LineNotify < OmniAuth::Strategies::OAuth2
      option :name, 'line_notify'

      option :client_options, {:site  => 'https://notify-bot.line.me/',
                               :authorize_url => '/oauth/authorize',
                               :token_url     => '/oauth/token',
                               :proxy => ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil}

      def authorize_params
        super.tap do |params|
          params[:scope] = 'notify'
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
