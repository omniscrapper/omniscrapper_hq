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

          task.scrapper_params.each do |name, selector|
            config.field name.to_sym, selector: selector
          end
        end
      end
    end
  end
end
