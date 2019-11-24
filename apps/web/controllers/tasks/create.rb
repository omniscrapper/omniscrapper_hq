module Web
  module Controllers
    module Tasks
      class Create
        include Web::Action
        include Dry::Monads::Result::Mixin
        include Import[
          create_task: 'operations.task.create'
        ]

        params do
          required(:task).schema do
            required(:site_id).filled
            required(:schema_id).filled
            required(:output_id).filled
            required(:crawler).filled
            required(:crawler_params).filled
            required(:scrapper_params).filled
          end
        end

        def call(params)
          result = create_task.call(params.to_hash)

          case result
          when Success
            flash[:success] = 'Task was successfully created.'
            redirect_to routes.tasks_path
          when Failure
            flash[:error] = 'There was an error during task creation.'
          end
        end
      end
    end
  end
end
