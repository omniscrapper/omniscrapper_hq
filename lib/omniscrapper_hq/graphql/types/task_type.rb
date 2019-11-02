require 'json'

module Graphql
  module Types
    class TaskType < BaseType
      field :id, ID, null: false
      field :crawler, String, null: false

      field :site, SiteType, null: false
      def site
        SiteRepository.new.find(object.site_id)
      end

      field :schema, SchemaType, null: false
      def schema
        SchemaRepository.new.find(object.schema_id)
      end

      field :crawler_params, String, null: false
      def crawler_params
        JSON.generate(object.crawler_params)
      end

      field :scrapper_params, String, null: false
      def scrapper_params
        JSON.generate(object.scrapper_params)
      end
    end
  end
end
