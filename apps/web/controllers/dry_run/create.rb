module Web
  module Controllers
    module DryRun
      # Performs a synchronous scrapping of a single page and displays a sample result
      class Create
        include Web::Action
        include Import[
          dry_run_create: 'operations.dry_run.perform',
          task_repo: 'repositories.task'
        ]

        expose :result, :task

        params do
          required(:task_id).filled
          optional(:dry_run).schema do
            required(:url).filled
          end
        end

        def call(params)
          @task = task_repo.find(params[:task_id])
          if params[:dry_run][:url]
            flash[:success] = 'Dry run was successfully performed.'
            @result = dry_run_create.call(params) 
          end
        end
      end
    end
  end
end
