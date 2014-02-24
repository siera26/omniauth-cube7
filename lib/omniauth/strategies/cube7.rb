require "omniauth/cube7/configuration"
require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Cube7 < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :cube7

      uid { raw_info["id"] }

      info do
        {
          :email        => raw_info["email"],
          :first_name   => raw_info["first_name"],
          :last_name    => raw_info["second_name"],
          :baio_status  => raw_info["baio_status"],
          :promo_code   => raw_info["promo_code"],
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize(Omniauth::Cube7.configuration.client_options))
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed
      end
    end
  end
end
