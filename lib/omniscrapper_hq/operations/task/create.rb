module Operations
  module Task
    # Creates a simple record for desired Task.
    class Create < Base
      include Import[
        'domain.configuration.crawler',
        'domain.configuration.fields',
        task_repo: 'repositories.task'
      ]

      ParamsSchema = Dry::Validation.Schema do
        required(:task).schema do
          required(:site_id).filled
          required(:schema_id).filled
          required(:crawler).filled

          # TODO: find a way to bypass dry-validations inability to have dynamic keys
          # https://github.com/dry-rb/dry-schema/issues/37
          required(:crawler_params).filled
          required(:scrapper_params).filled
        end
      end

      def call(params)
        values = yield validate(params)
        task = yield create_task(values)

        Success(task)
      end

      private

      def validate(params)
        result = ParamsSchema.call(params)

        if result.success?
          Success(result.output)
        else
          Failure(result.messages)
        end
      end

      def create_task(params)
        result = task_repo.create(params[:task])
        Success(params)
      end
    end
  end
end
