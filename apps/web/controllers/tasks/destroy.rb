module Web
  module Controllers
    module Tasks
      class Destroy
        include Web::Action
        include Import[
            task_repo: 'repositories.task'
        ]

        def call(params)
          task = task_repo.find(params[:id])
          task_repo.delete_with_dependencies(task.id)

          redirect_to routes.tasks_path
        end
      end
    end
  end
end
