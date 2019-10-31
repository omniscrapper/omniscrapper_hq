module Operations
  module DryRun
    # Executes scrapping of single target page and returns result
    class Perform < Base
      include Import[
        task_repo: 'repositories.task',
        schema_repo: 'repositories.schema',
        scrapper_builder: 'operations.scrapper.build'
      ]

      def call(params)
        task = task_repo.find(params[:task_id])
        schema = schema_repo.find(task.schema_id)
        scrapper_class = scrapper_builder.call(schema, task)
        scrapper_class.new.scrape_page(params[:dry_run][:url])
      end
    end
  end
end
