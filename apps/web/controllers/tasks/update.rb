module Web
  module Controllers
    module Tasks
      class Update
        include Web::Action
        include Import[
          task_repo: 'repositories.task'
        ]

        expose :task

        def call(params)
          # TODO: add validation
          # move to operation
          @task = task_repo.update(params[:id], params[:task])
          flash[:success] = 'Task was successfuly updated.'
          redirect_to routes.tasks_path
        end
      end
    end
  end
end
