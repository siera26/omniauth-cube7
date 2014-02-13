module Omniauth
  module Cube7
    # Stores runtime configuration information.
    #
    # @example Standard settings
    #     Omniauth::Cube7.configure do |config|
    #       config.site_url          = "http://cube7.com/api/v4"
    #     end
    #
    # @see Omniauth::Cube7.configure
    class << self
      attr_reader :configuration
    end

    def self.configuration
      @@configuration ||= Configuration.instance
    end

    def self.configure
      yield(self.configuration) if block_given?
    end

    class Configuration
      attr_writer :site, :authorize_url
      include Singleton

      def site
        @site || "http://www.cube7.com"
      end

      def authorize_url
        @authorize_url || "/oauth/authorize"
      end

      def client_options
        { site: self.site, authorize_url: self.authorize_url }
      end

    end

  end
end
