# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require 'dry/system/stubs'
require_relative '../config/environment'
require 'simplecov'

System::Container.enable_stubs!
System::Container.finalize!

Hanami.boot
Hanami::Utils.require!("#{__dir__}/support")

SimpleCov.start do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/test/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  db = Sequel::Model.db
  config.around(:each) do |example|
    db.transaction(rollback: :always, auto_savepoint: true) do
      example.run
    end
  end
end
