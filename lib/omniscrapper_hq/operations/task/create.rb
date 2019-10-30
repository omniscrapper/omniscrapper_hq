module Operations
  module Task
    # Creates a simple record for desired Task.
    class Create < Base
      ParamsSchema = Dry::Validation.Schema do
        required(:task).schema do
          required(:site_id).filled
          required(:schema_id).filled
          required(:crawler).filled

          #required(:crawler_params).schema do
            ## TODO: inject via dry-system
            #Domain::Configuration::Crawler
              #.new(crawler_name)
              #.required_fields
              #.each do

            #end
          #end

          #required(:scrapper_params).schema do

          #end
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
        Success(params)
      end
    end
  end
end
