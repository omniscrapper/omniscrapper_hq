require 'dry/system/container'
require 'dry/system/hanami'
require 'graphql/client'
require 'graphql/client/http'

module System
  class Container < Dry::System::Container
    extend Dry::System::Hanami::Resolver

    register_folder! 'omniscrapper_hq/domain/configuration'
    register_folder! 'omniscrapper_hq/repositories'
    register_folder! 'omniscrapper_hq/operations'

    register 'omniscrapper.crawlers' do
      OmniScrapper::Crawlers
    end

    register 'omniscrapper.root' do
      OmniScrapper
    end

    register 'omniscrapper.graphql_client' do
      http = GraphQL::Client::HTTP.new(ENV['SCHEDULER_API'])
      schema = GraphQL::Client.load_schema(http)
      GraphQL::Client.new(schema: schema, execute: http)
    end
  end
end
