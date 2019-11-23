module Operations
  module Output
    class Update < Base
      include Import[
        output_repo: 'repositories.output'
      ]

      ParamsSchema = Dry::Validation.Schema do
        required(:id).filled
        required(:output).schema do
          optional(:name).filled
          optional(:adapter).filled
          optional(:adapter_params).filled
        end
      end

      def call(params)
        load_output(params[:id])
        attributes = yield validate(params)
        output = yield update_output(attributes)
        Success(output)
      end

      private

      def validate(params)
        result = ParamsSchema.call(params)

        if result.success?
          Success(result.output)
        else
          Failure(@output)
        end
      end

      def update_output(params)
        result = output_repo.update(params[:id], params[:output])
        if result
          Success([result])
        else
          Failure([@output, 'can not update entry'])
        end
      end

      def load_output(id)
        @output ||= output_repo.find(id)
      end
    end
  end
end
