require 'dry/system/container'
require 'dry/system/hanami'

module System
  class Container < Dry::System::Container
    extend Dry::System::Hanami::Resolver

    register_folder! 'omniscrapper_hq/domain/configuration'
    register_folder! 'omniscrapper_hq/repositories'
    register_folder! 'omniscrapper_hq/operations'

    register 'omniscrapper.crawlers' do
      OmniScrapper::Crawlers
    end
  end
end
