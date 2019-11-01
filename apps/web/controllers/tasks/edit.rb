module Web
  module Controllers
    module Tasks
      class Edit
        include Web::Action
        include Import[
          task_repo: 'repositories.task'
        ]

        expose :task

        def call(params)
          @task = task_repo.find(params[:id])
        end
      end
    end
  end
end
