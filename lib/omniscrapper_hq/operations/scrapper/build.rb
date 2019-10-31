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

          config.entrypoint 'https://www.cmlt.ru/ads--rubric-88'
          config.next_page_link '→'
          config.page_link /ad-\w+/
          config.id_within_site /ad-(.+)/

          config.field :name, selector: '//*[@id="MainContentTable"]/div[1]/table/tbody/tr/td[1]/h1/span'
          config.field :description,
            selector: '//*[@id="MainContentTable"]/div[1]/div/div[1]/div/div[4]'
        end
      end
    end
  end
end
