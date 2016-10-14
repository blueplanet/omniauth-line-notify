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

      protected

      def build_access_token
        logger.debug "======> BUILD ACCESS TOKEN"
        puts "======> BUILD ACCESS TOKEN"
        verifier = request.params["code"]
        puts verifier
        client.auth_code.get_token(verifier, {:redirect_uri => callback_url}.merge(token_params.to_hash(:symbolize_keys => true)), deep_symbolize(options.auth_token_params))
      end
    end
  end
end
