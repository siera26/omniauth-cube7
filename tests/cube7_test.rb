require 'test_helper'
require 'omniauth-cube7'
require 'openssl'
require 'base64'

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

class ClientTest < StrategyTestCase
  test 'has correct Cube7 site' do
    assert_equal 'http://www.cube7.com', strategy.client.site
  end

  test 'has correct authorize url' do
    assert_equal '/oauth/authorize', strategy.client.options[:authorize_url]
  end

  test 'has correct token url' do
    assert_equal '/oauth/token', strategy.client.options[:token_url]
  end
end
