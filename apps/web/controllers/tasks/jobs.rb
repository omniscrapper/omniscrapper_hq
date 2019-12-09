module Web
  module Controllers
    module Tasks
      class Jobs
        include Web::Action
        include Import[
          task_statistics: 'domain.statistics.task'
        ]

        expose :task

        def call(params)
          @task = task_statistics.call(params[:id])
        end
      end
    end
  end
end
