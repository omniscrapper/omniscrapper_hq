# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require 'dry/system/stubs'
require_relative '../config/environment'
require 'simplecov'

System::Container.enable_stubs!
Hanami.boot
Hanami::Utils.require!("#{__dir__}/support")

SimpleCov.start

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
