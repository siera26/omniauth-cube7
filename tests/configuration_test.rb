require 'test_helper'
require 'omniauth-cube7'

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

class ConfigurationTest < StrategyTestCase
  test "should set the configuration vars from site url" do
    Omniauth::Cube7.configure do |config|
      config.site = "http://cube7-test.com"
    end
    assert_equal Omniauth::Cube7.configuration.site, "http://cube7-test.com"
    assert_equal 'http://cube7-test.com', strategy.client.site
  end

  test "should set configuration vars" do
    Omniauth::Cube7.configure do |config|
      config.authorize_url = "/oauth/authorize"
    end
    assert_equal Omniauth::Cube7.configuration.authorize_url, "/oauth/authorize"
  end
end
