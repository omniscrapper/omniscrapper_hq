module Operations
  module DryRun
    # Executes scrapping of single target page and returns result
    class Perform < Base
      include Import[
        task_repo: 'repositories.task',
        schema_repo: 'repositories.schema'
      ]

      def call(params)
        task = task_repo.find(params[:task_id])
        schema = schema_repo.find(task.schema_id)
        scrapper_class = build_scrapper(task, schema)
        scrapper_class.new.scrape_page(params[:dry_run][:url])
      end

      private

      def build_scrapper(task, schema)
        OmniScrapper.setup(:test_scrapper) do |config|
          config.schema schema.definition
          config.crawler :gallery

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
