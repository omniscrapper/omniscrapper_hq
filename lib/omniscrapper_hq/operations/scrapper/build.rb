module Operations
  module Scrapper
    # Creates an instance of scrapper for specified schema and task attributes
    class Build < Base
      include Import[
        omniscrapper: 'omniscrapper.root'
      ]

      def call(schema, task)
        omniscrapper.setup(:test_scrapper) do |config|
          config.schema schema.definition
          config.crawler task.crawler

          task.crawler_params.each do |name, value|
            config.public_send(name, value)
          end

          task.scrapper_params.each do |name, options|
            config.field name.to_sym, options
          end
        end
      end
    end
  end
end
