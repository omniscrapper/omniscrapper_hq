module Web
  module Controllers
    module DryRun
      class Create
        include Web::Action

        def call(params)
          flash[:success] = "Dry run for task #{params[:task_name]} was started."
          Workers::DryRun.perform_async
          redirect_to routes.tasks_path
        end
      end
    end
  end
end
