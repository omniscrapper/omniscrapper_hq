module Web
  module Controllers
    module DryRun
      class Create
        include Web::Action
        include Import[
          dry_run_create: 'operations.dry_run.perform'
        ]

        expose :result

        params do
          required(:task_id).filled
          optional(:dry_run).schema do
            required(:url).filled
          end
        end

        def call(params)
          @result = dry_run_create.call(params) if params[:dry_run][:url]
        end
      end
    end
  end
end
