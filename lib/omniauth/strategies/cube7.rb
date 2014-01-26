require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Cube7 < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :cube7

      option :client_options, {
        :site => "http://www.cube7.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :first_name => raw_info["first_name"],
          :last_name => raw_info["last_name"],
          :baio_status => raw_info["baio_status"],
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed
      end
    end
  end
end