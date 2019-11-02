require_relative '../base'
require_relative '../../repositories/task_repository'
require_relative '../../repositories/schema_repository'
require_relative '../../repositories/test_result_repository'

module Operations
  module SingleRun
    # Executes delayed scrapping and writes results to TestResult model
    class Perform < Base
      def call(params)
        task = ::TaskRepository.new.find(params[:task_id])
        schema = ::SchemaRepository.new.find(task.schema_id)
        scrapper_class = Operations::Scrapper::Build.new.call(schema, task)

        scrapper_class.run do |result|
          attrs = {
            task_id: params[:task_id],
            data: result.data,
            scrapper_name: result.scrapper_name.to_s,
            checksum: result.checksum,
            uri: result.uri
          }
          puts "Abount to insert #{attrs}"
          ::TestResultRepository.new.create(attrs)
        end
      end
    end
  end
end
